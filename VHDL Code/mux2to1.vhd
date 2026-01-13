library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux2to1 is 
    port(
        B   : in std_logic;
        S0  : in std_logic;
        S1  : in std_logic;
        Y  : out std_logic);
end mux2to1;

architecture structural of mux2to1 is 
begin
  process(B, S0, S1)
  begin
    if B = '1' then
      Y <= S0;
    else
      Y <= S1;
    end if;
  end process;
end structural;
