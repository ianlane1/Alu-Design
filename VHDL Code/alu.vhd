library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity alu is
  port(
    A : in std_logic_vector(63 downto 0);
    B : in std_logic_vector(63 downto 0);
    op_code : in std_logic_vector(2 downto 0);
    start : in std_logic;
    clk : in std_logic;
    reset : in std_logic;
    busy : out std_logic;
    cout : out std_logic;
    add_a : out std_logic_vector(63 downto 0);
    add_b : out std_logic_vector(63 downto 0);
    result : out std_logic_vector(63 downto 0) 
  );
end alu;

architecture structural of alu is
  component shift_register_64 
    port (
      D : in std_logic_vector(63 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      set : in std_logic;
      shift_mode : in std_logic;
      shift_in : in std_logic;
      Q : out std_logic_vector(63 downto 0)
    );
  end component;

  component adder_64
    port (
      A : in std_logic_vector(63 downto 0);
      B : in std_logic_vector(63 downto 0);
      cin : in std_logic;
      output : out std_logic_vector(63 downto 0);
      cout : out std_logic
    );
  end component;
  
  component xor2
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      o1 : out std_logic
    );
  end component;

  component or2
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      o1 : out std_logic
    );
  end component;

  component and2
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      o1 : out std_logic
    );
  end component;

  component and3
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      o1 : out std_logic
    );
  end component;

  component inverter
    port (
      input : in std_logic;
      output : out std_logic
    );
  end component;

  component tristate
    port (
      input : in std_logic;
      enable : in std_logic;
      output : out std_logic
    );
  end component;

  component dff
    port (
      d : in std_logic;
      clk : in std_logic;
      q : out std_logic
    );
  end component;

  component dff_p
    port (
      d : in std_logic;
      clk : in std_logic;
      q : out std_logic
    );
  end component;

  component mux2to1
    port (
      B : in std_logic;
      S0 : in std_logic;
      S1 : in std_logic;
      Y : out std_logic
    );
  end component;
  
  component mux4to1
    port (
      B : in std_logic_vector(1 downto 0);
      S0 : in std_logic;
      S1 : in std_logic;
      S2 : in std_logic;
      S3 : in std_logic;
      Y : out std_logic
    );
  end component;

  component state_machine
    port (
      op_code : in std_logic_vector(1 downto 0);
      clk : in std_logic;
      start : in std_logic;
      reset : in std_logic;
      busy : out std_logic;
      OE : out std_logic
    );
  end component;

  for state_machine_0 : state_machine use entity work.state_machine(structural);
  for shift_reg_a, shift_reg_b : shift_register_64 use entity work.shift_register_64(structural);
  for adder : adder_64 use entity work.adder_64(structural);

  for mult_mux: mux2to1 use entity work.mux2to1(structural);

  for a3_sub, a3_mult, a3_inc : and3 use entity work.and3(structural);
  for or2_shift, or2_cin: or2 use entity work.or2(structural);
  for inv_0: inverter use entity work.inverter(structural);

  for tristate_cout: tristate use entity work.tristate(structural);

  signal aff_out, bff_out, adder_a_in, b_xor, adder_b_in, adder_out, adder_dff_out, adder_dff_p_out, b_before_reversed, b_after_normal, mux_4_out, reset_mux_out : std_logic_vector(63 downto 0);
  signal op_code_ff, op_inv : std_logic_vector(2 downto 0);
  signal multiply_sig, sub_sig, inc_sig, shift, reset_inv, multiply_mux_out, adder_cin, OE, adder_cout : std_logic;

  begin
    inv_0: inverter port map(reset, reset_inv);

    G_OP: for i in 0 to 2 generate
      dff_op_i: dff_p port map(op_code(i), clk, op_code_ff(i)); -- generates 3 flip flops to hold the opcode input
      inv_op_i: inverter port map(op_code_ff(i), op_inv(i)); --  generates 3 inverters for the out put of the dff
    end generate G_OP;

    a3_sub: and3 port map(op_code_ff(2), op_inv(1), op_inv(0), sub_sig); -- sub signal is for cin of adder
    a3_mult: and3 port map(op_inv(2), op_code_ff(1), op_code_ff(0), multiply_sig); -- multiply sig is for the 2 to 1 mux indicating whether the output of the A_ff should be anded with output of B_ff when doing multiplication

    a3_inc: and3 port map(op_inv(2), op_inv(1), op_code_ff(0), inc_sig);

    or2_cin: or2 port map(inc_sig, sub_sig, adder_cin);

    -- shift mode needs to be 1 on multiply or left shift, otherwise it doesnt matter
    or2_shift: or2 port map(multiply_sig, op_code_ff(2), shift);

    -- shift in should always be 0, which is essentially what reset always is
    shift_reg_a: shift_register_64 port map(A, clk, reset, start, shift, reset, aff_out);
    shift_reg_b: shift_register_64 port map(b_before_reversed, clk, reset, start, shift, reset, bff_out);

    -- This single multuply mux out signal is input to every and gate.
    -- Reset_inv is essentially always 1 when doing multiplication
    mult_mux: mux2to1 port map(multiply_sig, bff_out(63), reset_inv, multiply_mux_out);

    G_LOGIC: for i in 0 to 63 generate
      -- logic implementation
      b_before_reversed(i) <= B(63 - i); -- The lsb of B should be the MSB in the shift register for multiplication
      A_and_i: and2 port map(aff_out(i), multiply_mux_out, adder_a_in(i));

      xor2_i: xor2 port map(sub_sig, bff_out(63 - i), b_xor(i)); -- when subtracting we xor them to add a with 2's complement
      mux4_i: mux4to1 port map(op_code_ff(1 downto 0),  b_xor(i), reset_inv, reset, adder_dff_p_out(i), mux_4_out(i));

      -- extra 2 to 1 mux to let 0 through on increment
      mux2_i: mux2to1 port map(inc_sig, reset, mux_4_out(i), adder_b_in(i));

      -- First negative edge dff
      dff_i: dff port map(adder_out(i), clk, adder_dff_out(i));

      -- reset mux to reset the output flip flops to 0. Needed mainly for multiplication
      mux_reset_i: mux2to1 port map(start, reset, adder_dff_out(i), reset_mux_out(i));

      -- Second posative edge dff
      dff_p_i: dff_p port map(reset_mux_out(i), clk, adder_dff_p_out(i));

      -- tri state buffer contolled by state machine
      tri_state_buffer_i: tristate port map(adder_dff_p_out(i), OE, result(i));

    end generate G_LOGIC;

    state_machine_0: state_machine port map(op_code_ff(1 downto 0), clk, start, reset, busy, OE);

    adder: adder_64 port map(adder_a_in, adder_b_in, adder_cin, adder_out, adder_cout);

    tristate_cout: tristate port map(adder_cout, OE, cout);

    add_a <= adder_a_in;
    add_b <= adder_b_in;

end structural;




