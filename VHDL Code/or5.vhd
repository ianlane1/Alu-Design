library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity or5 is
  port (
    i1 : in std_logic;
    i2 : in std_logic;
    i3 : in std_logic;
    i4 : in std_logic;
    i5 : in std_logic;
    o1 : out std_logic
  );
end or5;

architecture structural of or5 is
begin
  o1 <= i1 or i2 or i3 or i4 or i5;

end structural;
