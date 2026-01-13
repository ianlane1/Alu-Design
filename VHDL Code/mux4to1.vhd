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

architecture structural of mux4to1 is
begin
  process(B, S0, S1, S2, S3)
  begin
    if B(1) = '1' then
      if B(0) = '1' then
        Y <= S3;
      else
        Y <= S2;
      end if;
    else
      if B(0) = '1' then
        Y <= S1;
      else
        Y <= S0;
      end if;
    end if;
  end process;
end structural;
