LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;

ENTITY LFSR8 IS
  PORT (Clk, Rst: IN std_logic;
        output: OUT std_logic_vector (7 DOWNTO 0));
END LFSR8;

ARCHITECTURE LFSR8_beh OF LFSR8 IS
  SIGNAL Currstate, Nextstate: std_logic_vector (7 DOWNTO 0);
  SIGNAL feedback: std_logic;
BEGIN

  StateReg: PROCESS (Clk,Rst)
  BEGIN
    IF (Rst = '0') THEN
      Currstate <= (0 => '1', OTHERS =>'0');
    ELSIF (rising_edge(Clk)) THEN
      Currstate <= Nextstate;
    END IF;
  END PROCESS;
  
  feedback <= Currstate(4) XOR Currstate(3) XOR Currstate(2) XOR Currstate(0);
  Nextstate <= feedback & Currstate(7 DOWNTO 1);
  output <= Currstate;

END LFSR8_beh;