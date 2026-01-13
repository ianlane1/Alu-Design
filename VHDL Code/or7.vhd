library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity or7 is
  port (
    i1 : in std_logic;
    i2 : in std_logic;
    i3 : in std_logic;
    i4 : in std_logic;
    i5 : in std_logic;
    i6 : in std_logic;
    i7 : in std_logic;
    o1 : out std_logic
  );
end or7;

architecture structural of or7 is

  component or3
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      o1 : out std_logic
    );
  end component;
  
  for or3_1, or3_2, or3_3: or3 use entity work.or3(structural);
  
  signal tmp1, tmp2: std_logic;
begin
  or3_1: or3 port map(i1, i2, i3, tmp1);
  or3_2: or3 port map(i4, i5, i6, tmp2);
  or3_3: or3 port map(tmp1, tmp2, i7, o1);

end structural;
