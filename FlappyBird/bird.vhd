LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;

ENTITY bird IS
	PORT
		( clk, vert_sync, left_click, pause, reset	: IN std_logic;
        pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
		  state : IN STD_LOGIC_VECTOR(1 downto 0);
		  bird_on_signal, bird_dead: OUT std_logic;
		  bird_address : OUT STD_logic_vector(7 DOWNTO 0)
		  );
END bird;

architecture behavior of bird is

SIGNAL size 					: std_logic_vector(9 DOWNTO 0);  
SIGNAL ball_y_pos				: std_logic_vector(9 DOWNTO 0) := "0011001000";
SiGNAL ball_x_pos				: std_logic_vector(10 DOWNTO 0);
SIGNAL mouse_state 			: STD_logic;
SIGNAL gravity 				: std_logic_vector(9 downto 0);
SIGNAL x_addy, y_addy		: std_logic_vector(3 DOWNTO 0);
BEGIN  
         
gravity <= CONV_STD_LOGIC_VECTOR(3,10) when pause = '0' else CONV_STD_LOGIC_VECTOR(0,10);
size <= CONV_STD_LOGIC_VECTOR(16,10);
ball_x_pos <= CONV_STD_LOGIC_VECTOR(50,11);
bird_dead <= '1' when ('0' & ball_y_pos >= CONV_STD_LOGIC_VECTOR(479,10) - size) else '0';


x_addy <= pixel_column(3 DOWNTO 0) - ball_x_pos(3 DOWNTO 0) + CONV_STD_LOGIC_VECTOR(1,4);
y_addy <= pixel_row(3 DOWNTO 0) - ball_y_pos(3 DOWNTO 0);
bird_address <= x_addy & y_addy;


bird_on_signal <= '1' when (
								(ball_x_pos <= ('0' & pixel_column)) and
								((ball_x_pos + ('0' & size)) > ('0' & pixel_column)) and
								(ball_y_pos <= pixel_row) and
								((ball_y_pos + size) > pixel_row)
								) else '0';
		
Move_Ball: process (clk, vert_sync)	
begin
	if(reset = '0') then
		ball_y_pos <= "0011001000";
	elsif (rising_edge(vert_sync)) then	
			if (left_click = '1' and mouse_state = '0' and pause = '0') then
				if ('0' & ball_y_pos <= CONV_STD_LOGIC_VECTOR(78,10)) then
					ball_y_pos <= CONV_STD_LOGIC_VECTOR(0,10) + size;
				else 
					ball_y_pos <= ball_y_pos - 70;
				end if;
			else 
				ball_y_pos <= ball_y_pos +  gravity;
		end if;
		
		mouse_state <= left_click;
	end if;
	
end process Move_Ball;
END behavior;

