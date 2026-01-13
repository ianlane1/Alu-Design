library IEEE;
library STD;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity shift_register_64_test is
end shift_register_64_test;

architecture test of shift_register_64_test is
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

  for s1: shift_register_64 use entity work.shift_register_64(structural);

  signal clk, reset, set, shift_mode, shift_in : std_logic;
  signal D, Q: std_logic_vector(63 downto 0);

  procedure print_output is
    variable outline : line;

  begin
    write(outline, string'("reset = "));
    write(outline, reset);
    write(outline, string'("clk = "));
    write(outline, clk);
    write(outline, string'("d = "));
    write(outline, D);
    write(outline, string'("q = "));
    write(outline, Q);
  end print_output;

begin
  s1 : shift_register_64 port map(D, clk, reset, set, shift_mode, shift_in, Q);

  clock : process
  begin
    clk <= '0','1' after 5 ns;
    wait for 10 ns;
  end process clock;

  sim_process : process
  begin
    reset <= '1';
    shift_in <= '0';
    shift_mode <= '0';
    set <= '0';
    print_output;
    wait until rising_edge(clk);

    reset <= '1';
    print_output;
    wait until falling_edge(clk);

    reset <= '0';
    D <= to_stdlogicvector(x"9000000500000000");
    print_output;
    wait until rising_edge(clk);

    set <= '1';
    print_output;
    wait until falling_edge(clk);
    D <= to_stdlogicvector(x"0000000000000000");
    print_output;
    wait until rising_edge(clk);
    set <= '0';
    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);

    print_output;
    wait until rising_edge(clk);
    
  end process sim_process;
end test;







