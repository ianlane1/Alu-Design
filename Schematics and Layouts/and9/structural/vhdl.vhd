-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Fri Jan 16 11:18:55 2026


architecture structural of and9 is

  component and3
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      o1 : out std_logic
    );
  end component;
  
  for and3_1, and3_2, and3_3, and3_4: and3 use entity work.and3(structural);
  
  signal tmp1, tmp2, tmp3: std_logic;
begin
  and3_1: and3 port map(i1, i2, i3, tmp1);
  and3_2: and3 port map(i4, i5, i6, tmp2);
  and3_3: and3 port map(i7, i8, i9, tmp3);
  and3_4: and3 port map(tmp1, tmp2, tmp3, o1);

end structural;
