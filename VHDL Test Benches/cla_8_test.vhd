library IEEE;
library STD;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cla_8_test is
end cla_8_test;

architecture test of cla_8_test is 
  component cla_8
    port (
      cin : in std_logic;
      A : in std_logic_vector(7 downto 0);
      B : in std_logic_vector(7 downto 0);
      cout : out std_logic;
      output : out std_logic_vector(7 downto 0)
    );
  end component;

  for i1: cla_8 use entity work.cla_8(structural);

  signal cin, cout, clock: std_logic;
  signal A, B, output: std_logic_vector(7 downto 0);

  begin
    i1 : cla_8 port map(cin, A, B, cout, output);

    clk : process
    begin
      clock <= '0','1' after 5 ns;
      wait for 10 ns;
    end process clk;

    io_process : process
      file infile : text is in "cla_8_in.txt";
      file outfile : text is out "cla_8_out.txt";
      variable a1: std_logic_vector(7 downto 0);
      variable b1: std_logic_vector(7 downto 0);
      variable o1: std_logic_vector(7 downto 0);
      variable ci, co: std_logic;
      variable outline : line;
      variable buf: line;

    begin
      while not (endfile(infile)) loop
        readline(infile, buf);
        read(buf, a1);
        A <= a1;

        readline(infile, buf);
        read(buf, b1);
        B <= b1;

        readline(infile, buf);
        read(buf, ci);
        cin <= ci;

        wait until falling_edge(clock);

        co := cout;
        o1 := output;

        write(buf, o1);
        writeline(outfile, buf);
        write(buf, co);
        writeline(outfile, buf);
      end loop;
      wait;
    end process io_process;
  end test;
