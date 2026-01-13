library IEEE;
library STD;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity alu_test is
end alu_test;

architecture test of alu_test is
  component alu
    port (
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
  end component;

  for alu_0: alu use entity work.alu(structural);

  signal A, B, result, add_a, add_b : std_logic_vector(63 downto 0);
  signal op_code : std_logic_vector(2 downto 0);
  signal start, clk, reset, busy, cout : std_logic;

  procedure print_output is
    variable outline : line;
  begin
    write(outline, string'("A = "));
    write(outline, A);
    write(outline, string'("B = "));
    write(outline, B);
    write(outline, string'("op_code = "));
    write(outline, op_code);
    write(outline, string'("start = "));
    write(outline, start);
    write(outline, string'("clk = "));
    write(outline, clk);
    write(outline, string'("reset = "));
    write(outline, reset);
    write(outline, string'("busy = "));
    write(outline, busy);
    write(outline, string'("cout = "));
    write(outline, cout);
    write(outline, string'("result = "));
    write(outline, result);
  end print_output;

  begin 
    alu_0: alu port map(A, B, op_code, start, clk, reset, busy, cout, add_a, add_b, result);

    clock : process
    begin
      clk <= '0','1' after 5 ns;
      wait for 10 ns;
    end process clock;
  
    sim_process : process
    begin
      reset <= '1';
      start <= '0';
      op_code <= "000";
      print_output;

      wait until rising_edge(clk);
      reset <= '0';
      A <= to_stdlogicvector(x"0000F00000000003");
      B <= to_stdlogicvector(x"0000100000000005");
      print_output;

      wait until falling_edge(clk);
      start <= '1';
      print_output;

      wait until rising_edge(clk);
      start <= '1';
      print_output;

      wait until falling_edge(clk);
      start <= '0';
      A <= (others => 'Z');
      B <= (others => 'Z');
      print_output;

      wait until rising_edge(clk);
      print_output;

      wait until rising_edge(clk);
      print_output;

      wait until rising_edge(clk);
      op_code <= "100"; -- subtract
      A <= to_stdlogicvector(x"FFFFFFFFFFFFFFFF");
      B <= to_stdlogicvector(x"1111111111111111");
      print_output;

      wait until falling_edge(clk);
      start <= '1';

      wait until rising_edge(clk);
      print_output;

      wait until falling_edge(clk);
      start <= '0';
      A <= (others => 'Z');
      B <= (others => 'Z');
      print_output;

      wait until rising_edge(clk);
      print_output;

      wait until rising_edge(clk);
      print_output;

      wait until rising_edge(clk);
      op_code <= "001"; -- increment
      A <= to_stdlogicvector(x"FFFFFFFFFFFFFFFF");
      --B <= to_stdlogicvector(x"1111111111111111"); -- remains Z
      print_output;

      wait until falling_edge(clk);
      start <= '1';

      wait until rising_edge(clk);
      print_output;

      wait until falling_edge(clk);
      start <= '0';
      A <= (others => 'Z');
      B <= (others => 'Z');
      print_output;

      wait until rising_edge(clk);
      print_output;

      wait until rising_edge(clk);
      print_output;

      wait until rising_edge(clk);
      op_code <= "101"; -- decrement
      A <= to_stdlogicvector(x"FFFFFFFFFFFFFFFF");
      -- B <= to_stdlogicvector(x"1111111111111111"); -- remains Z
      print_output;

      wait until falling_edge(clk);
      start <= '1';

      wait until rising_edge(clk);
      print_output;

      wait until falling_edge(clk);
      start <= '0';
      A <= (others => 'Z');
      B <= (others => 'Z');
      print_output;

      wait until rising_edge(clk);
      print_output;

      wait until rising_edge(clk);
      print_output;

      wait until rising_edge(clk);
      op_code <= "110"; -- left shift
      A <= to_stdlogicvector(x"FFFFFFFFFFFFFFFF");
      -- B <= to_stdlogicvector(x"1111111111111111"); -- remains Z
      print_output;

      wait until falling_edge(clk);
      start <= '1';

      wait until rising_edge(clk);
      print_output;

      wait until falling_edge(clk);
      start <= '0';
      A <= (others => 'Z');
      B <= (others => 'Z');
      print_output;

      wait until rising_edge(clk);
      print_output;

      wait until rising_edge(clk);
      print_output;

      wait until rising_edge(clk);
      op_code <= "010"; -- right shift
      A <= to_stdlogicvector(x"FFFFFFFFFFFFFFFF");
      -- B <= to_stdlogicvector(x"1111111111111111"); -- remains Z
      print_output;

      wait until falling_edge(clk);
      start <= '1';

      wait until rising_edge(clk);
      print_output;

      wait until falling_edge(clk);
      start <= '0';
      A <= (others => 'Z');
      B <= (others => 'Z');
      print_output;

      wait until rising_edge(clk);
      print_output;

      wait until rising_edge(clk);
      print_output;

      wait until rising_edge(clk);
      op_code <= "011"; -- multiply
      A <= to_stdlogicvector(x"0000000000000008");
      B <= to_stdlogicvector(x"0000000000000003"); -- remains Z
      print_output;

      wait until falling_edge(clk);
      start <= '1';

      wait until rising_edge(clk);
      print_output;

      wait until falling_edge(clk);
      start <= '0';
      A <= (others => 'Z');
      B <= (others => 'Z');
      print_output;

      for i in 0 to 30 loop
        wait until rising_edge(clk);
        print_output;
      end loop;

      wait until rising_edge(clk);
      print_output;

      wait until rising_edge(clk);


    end process sim_process;
end test;



