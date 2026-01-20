-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Fri Jan 16 11:18:55 2026


library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity state_machine is
  port (
    op_code : in std_logic_vector(1 downto 0);
    clk : in std_logic;
    start : in std_logic;
    reset : in std_logic;
    busy : out std_logic;
    --out_state : out std_logic_vector(3 downto 0);
    --count : out std_logic_vector(4 downto 0);
    --count_res : out std_logic;
    OE : out std_logic
  );
end state_machine;
