library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity current_state is
  port (
    reset : in std_logic;
    clk : in std_logic;
    next_state : in std_logic_vector(3 downto 0);
    busy_out : out std_logic;
    curr_state : out std_logic_vector(3 downto 0)
  );
end current_state;

architecture structural of current_state is
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

  component nor2
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      o1 : out std_logic
    );
  end component;

  for i1 : inverter use entity work.inverter(structural);
  for reset_mux_0 : mux2to1 use entity work.mux2to1(structural);
  for nor2_0: nor2 use entity work.nor2(structural);
  for dff_busy: dff use entity work.dff(structural);

  signal reset_inv, tmp, busy : std_logic;
  signal d_in, q_out, tmp_v : std_logic_vector(3 downto 0);

  begin
    i1 : inverter port map(reset, reset_inv);
    reset_mux_0: mux2to1 port map(reset, reset, tmp_v(0), d_in(0));

    G_RESET: for i in 1 to 3 generate
      reset_mux_i: mux2to1 port map(reset, reset_inv, tmp_v(i), d_in(i));
    end generate G_RESET;

    G_FF: for i in 0 to 3 generate
      dff_i: dff port map(next_state(i), clk, tmp_v(i));
      dff_p_i: dff_p port map(d_in(i), clk, q_out(i));
    end generate G_FF;

    nor2_0 : nor2 port map(next_state(0), next_state(3), busy);
    dff_busy : dff port map(busy, clk, busy_out);

    curr_state <= q_out;
end structural;




