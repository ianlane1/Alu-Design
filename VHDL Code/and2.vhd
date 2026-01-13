library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity and2 is

  port (
    i1   : in  std_logic;
    i2   : in  std_logic;
    o1   : out std_logic);
end and2;

architecture structural of and2 is

begin

  o1 <= i2 and i1;

end structural;

