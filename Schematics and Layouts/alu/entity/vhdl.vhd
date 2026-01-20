-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Fri Jan 16 11:18:55 2026


library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity alu is
  port(
    A : in std_logic_vector(63 downto 0);
    B : in std_logic_vector(63 downto 0);
    op_code : in std_logic_vector(2 downto 0);
    start : in std_logic;
    clk : in std_logic;
    reset : in std_logic;
    busy : out std_logic;
    cout : out std_logic;
    add_a : out std_logic_vector(63 downto 0);
    add_b : out std_logic_vector(63 downto 0);
    result : out std_logic_vector(63 downto 0) 
  );
end alu;
