library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity and6 is
  port (
    i1 : in std_logic;
    i2 : in std_logic;
    i3 : in std_logic;
    i4 : in std_logic;
    i5 : in std_logic;
    i6 : in std_logic;
    o1 : out std_logic
  );
end and6;

architecture structural of and6 is
  component and2
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      o1 : out std_logic
    );
  end component;

  component and3
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      o1 : out std_logic
    );
  end component;
  
  for and3_1, and3_2: and3 use entity work.and3(structural);
  for and2_1: and2 use entity work.and2(structural);
  
  signal tmp1, tmp2: std_logic;
begin
  and3_1: and3 port map(i1, i2, i3, tmp1);
  and3_2: and3 port map(i4, i5, i6, tmp2);
  and2_1: and2 port map(tmp1, tmp2, o1);

end structural;
