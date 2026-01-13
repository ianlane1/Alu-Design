library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity or6 is
  port (
    i1 : in std_logic;
    i2 : in std_logic;
    i3 : in std_logic;
    i4 : in std_logic;
    i5 : in std_logic;
    i6 : in std_logic;
    o1 : out std_logic
  );
end or6;

architecture structural of or6 is
  component or2
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      o1 : out std_logic
    );
  end component;

  component or3
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      o1 : out std_logic
    );
  end component;
  
  for or3_1, or3_2: or3 use entity work.or3(structural);
  for or2_1: or2 use entity work.or2(structural);
  
  signal tmp1, tmp2: std_logic;
begin
  or3_1: or3 port map(i1, i2, i3, tmp1);
  or3_2: or3 port map(i4, i5, i6, tmp2);
  or2_1: or2 port map(tmp1, tmp2, o1);

end structural;
