-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Fri Jan 16 11:18:55 2026


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
