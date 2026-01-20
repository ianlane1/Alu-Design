-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Fri Jan 16 11:18:55 2026


library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity shift_register_64 is
  port (
    D : in std_logic_vector(63 downto 0);
    clk : in std_logic;
    reset : in std_logic;
    set : in std_logic;
    shift_mode: in std_logic; -- 1 left shift, 0 right shift
    shift_in: in std_logic;
    Q : out std_logic_vector(63 downto 0)
  );
end shift_register_64;
