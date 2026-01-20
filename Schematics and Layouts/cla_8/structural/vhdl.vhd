-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Fri Jan 16 11:18:55 2026


architecture structural of cla_8 is
  component and2
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      o1 : out std_logic
    );
  end component;

  component and3
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      o1 : out std_logic
    );
  end component;

  component and4
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      i4 : in std_logic; 
      o1 : out std_logic
    );
  end component;

  component and5
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      i4 : in std_logic;
      i5 : in std_logic;
      o1 : out std_logic
    );
  end component;

  component and6
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      i4 : in std_logic;
      i5 : in std_logic;
      i6 : in std_logic;
      o1 : out std_logic
    );
  end component;

  component and7
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      i4 : in std_logic;
      i5 : in std_logic;
      i6 : in std_logic;
      i7 : in std_logic;
      o1 : out std_logic
    );
  end component;

  component and8
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      i4 : in std_logic;
      i5 : in std_logic;
      i6 : in std_logic;
      i7 : in std_logic;
      i8 : in std_logic;
      o1 : out std_logic
    );
  end component;

  component and9
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      i4 : in std_logic;
      i5 : in std_logic;
      i6 : in std_logic;
      i7 : in std_logic;
      i8 : in std_logic;
      i9 : in std_logic;
      o1 : out std_logic
    );
  end component;


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

  component or4
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      i4 : in std_logic; 
      o1 : out std_logic
    );
  end component;

  component or5
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      i4 : in std_logic;
      i5 : in std_logic;
      o1 : out std_logic
    );
  end component;

  component or6
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      i4 : in std_logic;
      i5 : in std_logic;
      i6 : in std_logic;
      o1 : out std_logic
    );
  end component;

  component or7
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      i4 : in std_logic;
      i5 : in std_logic;
      i6 : in std_logic;
      i7 : in std_logic;
      o1 : out std_logic
    );
  end component;

  component or8
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      i4 : in std_logic;
      i5 : in std_logic;
      i6 : in std_logic;
      i7 : in std_logic;
      i8 : in std_logic;
      o1 : out std_logic
    );
  end component;

  component or9
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      i4 : in std_logic;
      i5 : in std_logic;
      i6 : in std_logic;
      i7 : in std_logic;
      i8 : in std_logic;
      i9 : in std_logic;
      o1 : out std_logic
    );
  end component;

  component xor2
    port (
      i1 : in std_logic;
      i2 : in std_logic;
      o1 : out std_logic
    );
  end component;

  for a2_1, a2_2, a2_3, a2_4, a2_5, a2_6, a2_7, a2_8: and2 use entity work.and2(structural);
  for x2_1, x2_2, x2_3, x2_4, x2_5, x2_6, x2_7, x2_8: xor2 use entity work.xor2(structural);

  for a2_9, a2_10, a2_11, a2_12, a2_13, a2_14, a2_15, a2_16: and2 use entity work.and2(structural);
  for a3_1, a3_2, a3_3, a3_4, a3_5, a3_6, a3_7: and3 use entity work.and3(structural);
  for a4_1, a4_2, a4_3, a4_4, a4_5, a4_6: and4 use entity work.and4(structural);
  for a5_1, a5_2, a5_3, a5_4, a5_5: and5 use entity work.and5(structural);
  for a6_1, a6_2, a6_3, a6_4: and6 use entity work.and6(structural);
  for a7_1, a7_2, a7_3: and7 use entity work.and7(structural);
  for a8_1, a8_2: and8 use entity work.and8(structural);
  for a9_1: and9 use entity work.and9(structural);

  for or2_1: or2 use entity work.or2(structural);
  for or3_1: or3 use entity work.or3(structural);
  for or4_1: or4 use entity work.or4(structural);
  for or5_1: or5 use entity work.or5(structural);
  for or6_1: or6 use entity work.or6(structural);
  for or7_1: or7 use entity work.or7(structural);
  for or8_1: or8 use entity work.or8(structural);
  for or9_1: or9 use entity work.or9(structural);

  for x2_9, x2_10, x2_11, x2_12, x2_13, x2_14, x2_15, x2_16: xor2 use entity work.xor2(structural);


  -- arg1(2) means the first argument (highest andi) for the c3
  signal pi, gi, arg1: std_logic_vector(7 downto 0); -- and2 to and 9 using cin
  signal ci, arg2: std_logic_vector(6 downto 0); -- and2 to and8 using g0
  signal arg3: std_logic_vector(5 downto 0); -- and2 to and7 using g1
  signal arg4: std_logic_vector(4 downto 0); -- and2 to and6 using g2
  signal arg5: std_logic_vector(3 downto 0); -- and2 to and5 using g3
  signal arg6: std_logic_vector(2 downto 0); -- and2 to and4 using g4
  signal arg7: std_logic_vector(1 downto 0); -- and2 to and3 using g5
  signal arg8: std_logic; -- and2 using g6

  begin
    x2_1: xor2 port map(A(0), B(0), pi(0));
    x2_2: xor2 port map(A(1), B(1), pi(1));
    x2_3: xor2 port map(A(2), B(2), pi(2));
    x2_4: xor2 port map(A(3), B(3), pi(3));
    x2_5: xor2 port map(A(4), B(4), pi(4));
    x2_6: xor2 port map(A(5), B(5), pi(5));
    x2_7: xor2 port map(A(6), B(6), pi(6));
    x2_8: xor2 port map(A(7), B(7), pi(7));

    a2_1: and2 port map(A(0), B(0), gi(0));
    a2_2: and2 port map(A(1), B(1), gi(1));
    a2_3: and2 port map(A(2), B(2), gi(2));
    a2_4: and2 port map(A(3), B(3), gi(3));
    a2_5: and2 port map(A(4), B(4), gi(4));
    a2_6: and2 port map(A(5), B(5), gi(5));
    a2_7: and2 port map(A(6), B(6), gi(6));
    a2_8: and2 port map(A(7), B(7), gi(7));

    a2_9: and2 port map(pi(0), cin, arg1(0));
    a2_10: and2 port map(pi(1), gi(0), arg2(0));
    a2_11: and2 port map(pi(2), gi(1), arg3(0));
    a2_12: and2 port map(pi(3), gi(2), arg4(0));
    a2_13: and2 port map(pi(4), gi(3), arg5(0));
    a2_14: and2 port map(pi(5), gi(4), arg6(0));
    a2_15: and2 port map(pi(6), gi(5), arg7(0));
    a2_16: and2 port map(pi(7), gi(6), arg8);

    a3_1: and3 port map(pi(1), pi(0), cin, arg1(1));
    a3_2: and3 port map(pi(2), pi(1), gi(0), arg2(1)); 
    a3_3: and3 port map(pi(3), pi(2), gi(1), arg3(1));
    a3_4: and3 port map(pi(4), pi(3), gi(2), arg4(1)); 
    a3_5: and3 port map(pi(5), pi(4), gi(3), arg5(1)); 
    a3_6: and3 port map(pi(6), pi(5), gi(4), arg6(1)); 
    a3_7: and3 port map(pi(7), pi(6), gi(5), arg7(1)); 

    a4_1: and4 port map(pi(2), pi(1), pi(0), cin, arg1(2));
    a4_2: and4 port map(pi(3), pi(2), pi(1), gi(0), arg2(2)); 
    a4_3: and4 port map(pi(4), pi(3), pi(2), gi(1), arg3(2)); 
    a4_4: and4 port map(pi(5), pi(4), pi(3), gi(2), arg4(2)); 
    a4_5: and4 port map(pi(6), pi(5), pi(4), gi(3), arg5(2)); 
    a4_6: and4 port map(pi(7), pi(6), pi(5), gi(4), arg6(2));

    a5_1: and5 port map(pi(3), pi(2), pi(1), pi(0), cin, arg1(3));
    a5_2: and5 port map(pi(4), pi(3), pi(2), pi(1), gi(0), arg2(3));
    a5_3: and5 port map(pi(5), pi(4), pi(3), pi(2), gi(1), arg3(3)); 
    a5_4: and5 port map(pi(6), pi(5), pi(4), pi(3), gi(2), arg4(3)); 
    a5_5: and5 port map(pi(7), pi(6), pi(5), pi(4), gi(3), arg5(3));

    a6_1: and6 port map(pi(4), pi(3), pi(2), pi(1), pi(0), cin, arg1(4));
    a6_2: and6 port map(pi(5), pi(4), pi(3), pi(2), pi(1), gi(0), arg2(4));
    a6_3: and6 port map(pi(6), pi(5), pi(4), pi(3), pi(2), gi(1), arg3(4));
    a6_4: and6 port map(pi(7), pi(6), pi(5), pi(4), pi(3), gi(2), arg4(4));

    a7_1: and7 port map(pi(5), pi(4), pi(3), pi(2), pi(1), pi(0), cin, arg1(5));
    a7_2: and7 port map(pi(6), pi(5), pi(4), pi(3), pi(2), pi(1), gi(0), arg2(5));
    a7_3: and7 port map(pi(7), pi(6), pi(5), pi(4), pi(3), pi(2), gi(1), arg3(5));

    a8_1: and8 port map(pi(6), pi(5), pi(4), pi(3), pi(2), pi(1), pi(0), cin, arg1(6));
    a8_2: and8 port map(pi(7), pi(6), pi(5), pi(4), pi(3), pi(2), pi(1), gi(0), arg2(6));

    a9_1: and9 port map(pi(7), pi(6), pi(5), pi(4), pi(3), pi(2), pi(1), pi(0), cin, arg1(7));

    or2_1: or2 port map(gi(0), arg1(0), ci(0));
    or3_1: or3 port map(gi(1), arg2(0), arg1(1), ci(1));
    or4_1: or4 port map(gi(2), arg3(0), arg2(1), arg1(2), ci(2));
    or5_1: or5 port map(gi(3), arg4(0), arg3(1), arg2(2), arg1(3), ci(3));
    or6_1: or6 port map(gi(4), arg5(0), arg4(1), arg3(2), arg2(3), arg1(4), ci(4));
    or7_1: or7 port map(gi(5), arg6(0), arg5(1), arg4(2), arg3(3), arg2(4), arg1(5), ci(5));
    or8_1: or8 port map(gi(6), arg7(0), arg6(1), arg5(2), arg4(3), arg3(4), arg2(5), arg1(6), ci(6));
    or9_1: or9 port map(gi(7), arg8, arg7(1), arg6(2), arg5(3), arg4(4), arg3(5), arg2(6), arg1(7), cout);

    x2_9: xor2 port map(pi(0), cin, output(0));
    x2_10: xor2 port map(pi(1), ci(0), output(1));
    x2_11: xor2 port map(pi(2), ci(1), output(2));
    x2_12: xor2 port map(pi(3), ci(2), output(3));
    x2_13: xor2 port map(pi(4), ci(3), output(4));
    x2_14: xor2 port map(pi(5), ci(4), output(5));
    x2_15: xor2 port map(pi(6), ci(5), output(6));
    x2_16: xor2 port map(pi(7), ci(6), output(7));

  end structural;
