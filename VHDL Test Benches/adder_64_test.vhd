library IEEE;
library STD;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity adder_64_test is
end adder_64_test;

architecture test of adder_64_test is
  component adder_64
    port (
      A : in std_logic_vector(63 downto 0);
      B : in std_logic_vector(63 downto 0);
      cin : in std_logic;
      output : out std_logic_vector(63 downto 0);
      cout : out std_logic
    );
  end component;

  
  for adder_0: adder_64 use entity work.adder_64(structural);

  signal A, B, output : std_logic_vector(63 downto 0);
  signal cin, cout, clk : std_logic;

  procedure print_output is
    variable outline : line;
  begin
    write(outline, string'("A = "));
    write(outline, A);
    write(outline, string'("B = "));
    write(outline, B);
    write(outline, string'("clk = "));
    write(outline, clk);
    write(outline, string'("cout = "));
    write(outline, cout);
    write(outline, string'("result = "));
    write(outline, output);
  end print_output;

  begin 
    adder_0: adder_64 port map(A, B, cin, output, cout);

    clock : process
    begin
      clk <= '0','1' after 5 ns;
      wait for 10 ns;
    end process clock;
  
    sim_process : process
    begin
      A <= to_stdlogicvector(x"0000000000000003");
      B <= to_stdlogicvector(x"0000000000000005");
      cin <= '0';
      print_output;

      wait until rising_edge(clk);
      print_output;

      wait until falling_edge(clk);
      A <= to_stdlogicvector(x"0000000000000003");
      B <= to_stdlogicvector(x"0000000000000005");
      cin <= '1';
      print_output;

      wait until rising_edge(clk);
      A <= to_stdlogicvector(x"0003000000000003");
      B <= to_stdlogicvector(x"0005000000000005");
      cin <= '0';
      print_output;

      wait until falling_edge(clk);
      print_output;

      wait until rising_edge(clk);
      A <= to_stdlogicvector(x"FFFFFFFFFFFFFFFF");
      B <= to_stdlogicvector(x"0000000000000000");
      cin <= '1';
      print_output;

      wait until falling_edge(clk);
      print_output;



    end process sim_process;
  end test;


