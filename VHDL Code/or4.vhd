library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity or4 is
  port (
    i1 : in std_logic;
    i2 : in std_logic;
    i3 : in std_logic;
    i4 : in std_logic;
    o1 : out std_logic
  );
end or4;

architecture structural of or4 is
begin
  o1 <= i1 or i2 or i3 or i4;

end structural;
