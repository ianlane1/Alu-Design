library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity or2 is
  port (
    i1 : in std_logic;
    i2 : in std_logic;
    o1 : out std_logic
  );
end or2;

architecture structural of or2 is

begin

  o1 <= i1 or i2;

end structural;
