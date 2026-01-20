-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Fri Jan 16 11:18:55 2026


architecture structural of or8 is
  component or2
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      o1 : out std_logic
    );
  end component;

  component or3
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      o1 : out std_logic
    );
  end component;
  
  for or3_1, or3_2, or3_3: or3 use entity work.or3(structural);
  for or2_1: or2 use entity work.or2(structural);
  
  signal tmp1, tmp2, tmp3: std_logic;
begin
  or3_1: or3 port map(i1, i2, i3, tmp1);
  or3_2: or3 port map(i4, i5, i6, tmp2);
  or2_1: or2 port map(i7, i8, tmp3);
  or3_3: or3 port map(tmp1, tmp2, tmp3, o1);

end structural;
