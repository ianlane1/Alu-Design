-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Fri Jan 16 11:18:55 2026


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
