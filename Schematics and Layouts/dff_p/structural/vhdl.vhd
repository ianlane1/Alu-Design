-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Fri Jan 16 11:18:55 2026


architecture structural of dff_p is

begin
  
  output: process

  begin
    wait until (clk'EVENT and clk = '1');
    q <= d;
  end process output;

end structural;
