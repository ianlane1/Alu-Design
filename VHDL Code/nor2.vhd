library IEEE;
use IEEE.std_logic_1164.all;

entity nor2 is 
  port (
    i1 : in std_logic;
    i2 : in std_logic;
    o1 : out std_logic
  );
end nor2;

architecture structural of nor2 is
begin
  o1 <= i1 nor i2;
end structural;
