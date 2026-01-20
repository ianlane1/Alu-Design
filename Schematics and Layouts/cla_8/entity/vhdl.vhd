-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Fri Jan 16 11:18:55 2026


library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity cla_8 is 
  port (
    cin : in std_logic;
    A : in std_logic_vector(7 downto 0);
    B : in std_logic_vector(7 downto 0);
    cout : out std_logic;
    output : out std_logic_vector(7 downto 0)
  );
end cla_8;
