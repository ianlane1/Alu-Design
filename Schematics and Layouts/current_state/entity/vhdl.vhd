-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Fri Jan 16 11:18:55 2026


library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity current_state is
  port (
    reset : in std_logic;
    clk : in std_logic;
    next_state : in std_logic_vector(3 downto 0);
    busy_out : out std_logic;
    curr_state : out std_logic_vector(3 downto 0)
  );
end current_state;
