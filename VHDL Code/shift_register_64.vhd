library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity shift_register_64 is
  port (
    D : in std_logic_vector(63 downto 0);
    clk : in std_logic;
    reset : in std_logic;
    set : in std_logic;
    shift_mode: in std_logic; -- 1 left shift, 0 right shift
    shift_in: in std_logic;
    Q : out std_logic_vector(63 downto 0)
  );
end shift_register_64;

--   Reset    Set
--    1        x    All DFF get 0
--    0        1    DFF(i) get D(i)
--    0        0    DFF(i) get DFF(i-1)

architecture structural of shift_register_64 is
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

  component inverter
    port (
      input : in std_logic;
      output : out std_logic
    );
  end component;

  for i1: inverter use entity work.inverter(structural);
  for mux_set_0, mux_shift_0, mux_shift_63: mux2to1 use entity work.mux2to1(structural);

  signal q_out, d_in, q_determine: std_logic_vector(63 downto 0);
  signal inputs_reset_mux : std_logic_vector(63 downto 0);
  signal reset_inv: std_logic;

begin
  i1: inverter port map(reset, reset_inv);
  mux_set_0: mux2to1 port map(set, D(0), q_determine(0), inputs_reset_mux(0));

  mux_shift_0: mux2to1 port map(shift_mode, shift_in, q_out(1), q_determine(0));
  mux_shift_63: mux2to1 port map(shift_mode, q_out(62), shift_in, q_determine(63));

  G_SHIFT_MUX: for i in 1 to 62 generate
    mux_shift_i: mux2to1 port map(shift_mode, q_out(i - 1), q_out(i + 1), q_determine(i));
  end generate G_SHIFT_MUX;

  G_SET_MUX: for i in 1 to 63 generate
    mux_set_i: mux2to1 port map(set, D(i), q_determine(i), inputs_reset_mux(i));
  end generate G_SET_MUX;

  G_RESET_MUX: for i in 0 to 63 generate
    mux_reset_i: mux2to1 port map(reset, reset_inv, inputs_reset_mux(i), d_in(i));
  end generate G_RESET_MUX;

  G_FF: for i in 0 to 63 generate
    dff_p_i: dff_p port map(d_in(i), clk, q_out(i));
  end generate G_FF;

  Q <= q_out;


end structural;



