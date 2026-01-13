library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity tristate is
  port (
    input : in std_logic;
    enable : in std_logic;
    output : out std_logic
  );
end tristate;

architecture structural of tristate is
begin
  output <= input when enable = '1' else 'Z';
end structural;
