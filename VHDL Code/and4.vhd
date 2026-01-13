library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity and4 is
  port (
    i1 : in std_logic;
    i2 : in std_logic;
    i3 : in std_logic;
    i4 : in std_logic;
    o1 : out std_logic
  );
end and4;

architecture structural of and4 is
begin
  o1 <= i1 and i2 and i3 and i4;

end structural;
