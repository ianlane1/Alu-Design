library IEEE;
use IEEE.std_logic_1164.all;

entity or3 is

  port (
    i1   : in  std_logic;
    i2   : in  std_logic;
    i3   : in  std_logic;
    o1   : out std_logic);
end or3;

architecture structural of or3 is

begin

  o1 <= i3 or i2 or i1;

end structural;

