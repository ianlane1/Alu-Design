library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity state_machine is
  port (
    op_code : in std_logic_vector(1 downto 0);
    clk : in std_logic;
    start : in std_logic;
    reset : in std_logic;
    busy : out std_logic;
    --out_state : out std_logic_vector(3 downto 0);
    --count : out std_logic_vector(4 downto 0);
    --count_res : out std_logic;
    OE : out std_logic
  );
end state_machine;

architecture structural of state_machine is
  component next_state
     port (
      curr_state : in std_logic_vector(3 downto 0);
      start : in std_logic;
      correct_count : in std_logic; -- 1, the counter is the correct count durring multiplication
      op_code : in std_logic_vector(1 downto 0);
      busy_in : in std_logic;
      counter_reset : out std_logic;
      out_state : out std_logic_vector(3 downto 0)
    );
  end component;

  component current_state
      port (
        reset : in std_logic;
        clk : in std_logic;
        next_state : in std_logic_vector(3 downto 0);
        busy_out : out std_logic;
        curr_state : out std_logic_vector(3 downto 0)
      );
  end component;

  component counter
   port (
    clk     : in  std_logic;
    rst		: in  std_logic;
    Q       : inout std_logic_vector(4 downto 0));
  end component;

  component dff_p
    port (
      d : in std_logic;
      clk : in std_logic;
      q : out std_logic
    );
  end component;

  component dff
    port (
      d : in std_logic;
      clk : in std_logic;
      q : out std_logic
    );
  end component;

  component inverter
    port (
      input : in std_logic;
      output : out std_logic
    );
  end component;

  component and5
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      i4 : in std_logic;
      i5 : in std_logic;
      o1 : out std_logic
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

  for next_state_0 : next_state use entity work.next_state(structural);
  for curr_state_0 : current_state use entity work.current_state(structural);
  for counter_0 : counter use entity work.counter(structural);
  for dff_p_0 : dff_p use entity work.dff_p(structural);
  for inv_0, inv_res : inverter use entity work.inverter(structural);
  for a5_0 : and5 use entity work.and5(structural);
  for mux_0 : mux2to1 use entity work.mux2to1(structural);
  for dff_0 : dff use entity work.dff(structural);


  signal curr_state_sig, next_state_sig : std_logic_vector(3 downto 0); 
  signal correct_count, count_inv, busy_out, busy_in, reset_inv, mux_out, counter_reset_in, counter_reset_out : std_logic;
  signal counter_bits : std_logic_vector(4 downto 0);

  begin
    inv_0 : inverter port map(counter_bits(0), count_inv);
    inv_res : inverter port map(reset, reset_inv);
    
    mux_0 : mux2to1 port map(reset, reset_inv, busy_out, mux_out);

    a5_0 : and5 port map(count_inv, counter_bits(1), counter_bits(2), counter_bits(3), counter_bits(4), correct_count);

    dff_0 : dff port map(counter_reset_in, clk, counter_reset_out);

    counter_0: counter port map(clk, counter_reset_out, counter_bits); -- counter needs reset to 0 to ensure the correct number of bits is counter for during state 5
    -- state 5 will go high at the same time counter outputs 00000
    
    next_state_0 : next_state port map(curr_state_sig, start, correct_count, op_code, busy_in, counter_reset_in, next_state_sig);
    curr_state_0 : current_state port map(reset, clk, next_state_sig, busy_out, curr_state_sig);

    dff_p_0 : dff_p port map(mux_out, clk, busy_in);

    busy <= busy_in;

    OE <= curr_state_sig(3); -- only output upon results state

    --out_state <= curr_state_sig;

    --count <= counter_bits;
    --count_res <= counter_reset_out;

end structural;


