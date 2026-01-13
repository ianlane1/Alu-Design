library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity and7 is
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
end and7;

architecture structural of and7 is

  component and3
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      o1 : out std_logic
    );
  end component;
  
  for and3_1, and3_2, and3_3: and3 use entity work.and3(structural);
  
  signal tmp1, tmp2: std_logic;
begin
  and3_1: and3 port map(i1, i2, i3, tmp1);
  and3_2: and3 port map(i4, i5, i6, tmp2);
  and3_3: and3 port map(tmp1, tmp2, i7, o1);

end structural;
