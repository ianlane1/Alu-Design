-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Fri Jan 16 11:18:55 2026


library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity or2 is
  port (
    i1 : in std_logic;
    i2 : in std_logic;
    o1 : out std_logic
  );
end or2;
