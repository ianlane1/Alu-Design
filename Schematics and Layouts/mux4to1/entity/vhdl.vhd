-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Fri Jan 16 11:18:55 2026


library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity mux4to1 is
  port (
    B : in std_logic_vector(1 downto 0);
    S0 : in std_logic;
    S1 : in std_logic;
    S2 : in std_logic;
    S3 : in std_logic;
    Y : out std_logic
  );
end mux4to1;
