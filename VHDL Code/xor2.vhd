library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity xor2 is

  port (
    i1   : in  std_logic;
    i2   : in  std_logic;
    o1   : out std_logic);
end xor2;

architecture structural of xor2 is

begin

  o1 <= i2 xor i1;

end structural;
