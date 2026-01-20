-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Fri Jan 16 11:18:55 2026


architecture structural of adder_64 is
  component cla_8
    port (
      cin : in std_logic;
      A : in std_logic_vector(7 downto 0);
      B : in std_logic_vector(7 downto 0);
      cout : out std_logic;
      output : out std_logic_vector(7 downto 0)
    );
  end component;

  for cla8_1, cla8_2, cla8_3, cla8_4, cla8_5, cla8_6, cla8_7, cla8_8: cla_8 use entity work.cla_8(structural);

  signal ci: std_logic_vector(6 downto 0);
  
  begin
    cla8_1: cla_8 port map(cin, A(7 downto 0), B(7 downto 0), ci(0), output(7 downto 0));
    cla8_2: cla_8 port map(ci(0), A(15 downto 8), B(15 downto 8), ci(1), output(15 downto 8));
    cla8_3: cla_8 port map(ci(1), A(23 downto 16), B(23 downto 16), ci(2), output(23 downto 16));
    cla8_4: cla_8 port map(ci(2), A(31 downto 24), B(31 downto 24), ci(3), output(31 downto 24));
    cla8_5: cla_8 port map(ci(3), A(39 downto 32), B(39 downto 32), ci(4), output(39 downto 32));
    cla8_6: cla_8 port map(ci(4), A(47 downto 40), B(47 downto 40), ci(5), output(47 downto 40));
    cla8_7: cla_8 port map(ci(5), A(55 downto 48), B(55 downto 48), ci(6), output(55 downto 48));
    cla8_8: cla_8 port map(ci(6), A(63 downto 56), B(63 downto 56), cout, output(63 downto 56));

  end structural;
