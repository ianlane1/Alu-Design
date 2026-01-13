library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity or9 is
  port (
    i1 : in std_logic;
    i2 : in std_logic;
    i3 : in std_logic;
    i4 : in std_logic;
    i5 : in std_logic;
    i6 : in std_logic;
    i7 : in std_logic;
    i8 : in std_logic;
    i9 : in std_logic;
    o1 : out std_logic
  );
end or9;

architecture structural of or9 is

  component or3
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      o1 : out std_logic
    );
  end component;
  
  for or3_1, or3_2, or3_3, or3_4: or3 use entity work.or3(structural);
  
  signal tmp1, tmp2, tmp3: std_logic;
begin
  or3_1: or3 port map(i1, i2, i3, tmp1);
  or3_2: or3 port map(i4, i5, i6, tmp2);
  or3_3: or3 port map(i7, i8, i9, tmp3);
  or3_4: or3 port map(tmp1, tmp2, tmp3, o1);

end structural;

