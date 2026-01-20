-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Fri Jan 16 11:18:55 2026


library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity next_state is
  port (
    curr_state : in std_logic_vector(3 downto 0);
    start : in std_logic;
    --clk : in std_logic;
    correct_count : in std_logic; -- 1, the counter is the correct count durring multiplication
    op_code : in std_logic_vector(1 downto 0);
    busy_in : in std_logic;
    counter_reset : out std_logic;
    out_state : out std_logic_vector(3 downto 0)
  );
end next_state;
