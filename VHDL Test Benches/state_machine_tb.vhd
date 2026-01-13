library IEEE;
library STD;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity state_machine_tb is
end state_machine_tb;

architecture test of state_machine_tb is
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

  for s1: state_machine use entity work.state_machine(structural);

  signal clk, reset, start, busy, OE : std_logic;
  signal op_code : std_logic_vector(1 downto 0);

  procedure print_output is
    variable outline : line;

  begin
    write(outline, string'("reset = "));
    write(outline, reset);
    write(outline, string'("clk = "));
    write(outline, clk);
    write(outline, string'("start = "));
    write(outline, start);
    write(outline, string'("op code = "));
    write(outline, op_code);
    write(outline, string'("busy ="));
    write(outline, busy);
    write(outline, string'("output enable"));
    write(outline, OE);
  end print_output;

begin
  s1 : state_machine port map(op_code, clk, start, reset, busy, OE);

  clock : process
  begin
    clk <= '0','1' after 5 ns;
    wait for 10 ns;
  end process clock;

  sim_process : process
  begin
    reset <= '1';
    start <= '0';
    op_code <= "00";
    print_output;

    wait until rising_edge(clk);
    reset <= '0';
    print_output;

    wait until falling_edge(clk);
    start <= '1';
    print_output;

    wait until rising_edge(clk);
    start <= '1';
    print_output;

    wait until falling_edge(clk);
    reset <= '0';
    start <= '0';
    print_output;

    wait until rising_edge(clk);
    print_output; -- should be in state 3

    
    wait until rising_edge(clk);
    start <= '1';
    op_code <= "10";
    print_output; -- bacl to idle state
    -- note to self, remove this block by allowing to move to state 1/2/3 from state 6

    wait until falling_edge(clk);
    start <= '0';
    print_output;

    wait until rising_edge(clk);
    print_output; -- state 2

    wait until falling_edge(clk);
    start <= '0';
    print_output;

    wait until rising_edge(clk);
    print_output; -- state 4

    wait until rising_edge(clk);
    print_output; -- state 6;

    wait until rising_edge(clk);
    start <= '1';
    op_code <= "11";
    print_output; -- state 0

    wait until falling_edge(clk);
    start <= '0';
    op_code <= "11";

    wait until rising_edge(clk);
    print_output; -- state 3

    wait until falling_edge(clk);
    start <= '0';
    print_output;

    wait until rising_edge(clk);
    print_output; -- state 5

    for i in 0 to 30 loop
      wait until rising_edge(clk);
      print_output;
    end loop;

    wait until rising_edge(clk);
    print_output; -- state 6

    wait until rising_edge(clk);
    print_output; -- state 0

    wait until rising_edge(clk);
    print_output; -- state 0

  end process sim_process;
end test;
