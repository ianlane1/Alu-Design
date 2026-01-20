-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Fri Jan 16 11:18:55 2026


architecture structural of mux2to1 is 
begin
  process(B, S0, S1)
  begin
    if B = '1' then
      Y <= S0;
    else
      Y <= S1;
    end if;
  end process;
end structural;
