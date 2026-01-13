library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity next_state is
  port (
    curr_state : in std_logic_vector(3 downto 0);
    start : in std_logic;
    --clk : in std_logic;
    correct_count : in std_logic; -- 1, the counter is the correct count durring multiplication
    op_code : in std_logic_vector(1 downto 0);
    busy_in : in std_logic;
    counter_reset : out std_logic;
    out_state : out std_logic_vector(3 downto 0)
  );
end next_state;

-- op code
-- 000 : add
-- 001 : inc
-- 010 : right shift
-- 011 : multiply
-- 100 : sub
-- 101 : dec
-- 110 : left shift

-- States
-- curr_state = 0: idle
-- curr_state = 1: wait 1 clock cycle
-- curr_state = 2: wait 31 (maybe 32) clock cycles
-- curr_state = 3: output enable

architecture structural of next_state is
  component inverter
    port (
      input : in std_logic;
      output : out std_logic
    );
  end component;

  component nor2
    port (
      i1 : in std_logic;
      i2 : in std_Logic;
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

  component dff
    port (
      d : in std_logic;
      clk : in std_logic;
      q : out std_logic
    );
  end component;
  
  for a2_1, a2_2, a2_3, a2_4: and2 use entity work.and2(structural);
  for a3_1: and3 use entity work.and3(structural);
  for a4_1, a4_2: and4 use entity work.and4(structural);
  --for nor2_0 : nor2 use entity work.nor2(structural);
    
  for correct_inv, busy_inv, inv_start: inverter use entity work.inverter(structural);

  --for dff_busy : dff use entity work.dff(structural);

  for or2_1, or2_2: or2 use entity work.or2(structural);
  for or3_1: or3 use entity work.or3(structural);

  signal op_inv : std_logic_vector(1 downto 0);
  signal individual_next : std_logic_vector(3 downto 0);
  signal leave_state_2, remain_state_2, move_state_2, add_sub_out, correct_count_inv, busy_in_inv, busy_and_start, d_in, remain_idle, start_inv : std_logic;

  begin
    G_INV: for i in 0 to 1 generate
      op_code_inv_i: inverter port map(op_code(i), op_inv(i));
   end generate G_INV;

    busy_inv : inverter port map(busy_in, busy_in_inv);

    a2_3: and2 port map(start, busy_in_inv, busy_and_start);

    -- to move to add/sub state, must be in idle, get start, and the second bit of the opcode must be 0
    a3_1: and3 port map(busy_and_start, curr_state(0), op_inv(1), add_sub_out);

    -- to move to rs/ls state, must be in idle, get start, the first bit of opcode must be a 0, and the second bit must be a 1
    a4_1: and4 port map(busy_and_start, curr_state(0), op_inv(0), op_code(1), individual_next(1));

    -- to move to multiply, must be in idle, get start, and first and second op code bits must be a 1
    a4_2: and4 port map(busy_and_start, curr_state(0), op_code(0), op_code(1), move_state_2);
    
    
    -- to move to state 2 current state must be idle with the add/sub signal or current state must be 2 and counter not equal to 31
    correct_inv: inverter port map(correct_count, correct_count_inv);

    a2_1: and2 port map(curr_state(2), correct_count_inv, remain_state_2);

    or2_1: or2 port map(remain_state_2, move_state_2, individual_next(2));

    -- to move to state 3, but be in state 1 or moving from idle during add/sub/inc/dec or state 2 with the correct count
    a2_2: and2 port map(curr_state(2), correct_count, leave_state_2);

    or3_1: or3 port map(add_sub_out, curr_state(1), leave_state_2, individual_next(3));

    -- always move to idle after the output state or remaining in idle
    inv_start : inverter port map(start, start_inv);

    a2_4 : and2 port map(curr_state(0), start_inv, remain_idle);
    or2_2 : or2 port map(curr_state(3), remain_idle, individual_next(0));

    out_state <= individual_next;

    counter_reset <= move_state_2;

end structural;


