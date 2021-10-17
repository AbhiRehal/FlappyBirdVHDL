LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


ENTITY power_up IS
	PORT
		( clk, vert_sync: IN std_logic;
        pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
		  state : IN STD_LOGIC_VECTOR(1 downto 0);
		  power_up_disable : IN STD_logic;
		  random_in : IN STD_logic_vector(7 DOWNTO 0);
		  reset : IN STD_logic;
		  powerup_address : OUT STD_logic_vector(7 DOWNTO 0);
		  powerup_on: OUT std_logic;
		  collect_lives : OUT STD_logic);
END power_up;

architecture behavior of power_up is
SIGNAL size 					: std_logic_vector(9 DOWNTO 0);  
SIGNAL powerup_y_pos			: std_logic_vector(9 DOWNTO 0);
SiGNAL powerup_x_pos			: std_logic_vector(10 DOWNTO 0);
SIGNAL x_addy, y_addy		: Std_logic_vector(3 DOWNTO 0);
SIGNAL flag : STD_logic := '0';
SIGNAL spawn_timer : integer range 0 to 250000000 := 0;
SIGNAL random_num : STD_logic_vector(7 DOWNTO 0);
BEGIN  
size <= CONV_STD_LOGIC_VECTOR(16,10);
powerup_x_pos <= CONV_STD_LOGIC_VECTOR(50,11);
powerup_y_pos <= CONV_STD_LOGIC_VECTOR(30, 10);

x_addy <= pixel_column(3 DOWNTO 0) - powerup_x_pos(3 DOWNTO 0) + CONV_STD_LOGIC_VECTOR(1,4);
y_addy <= pixel_row(3 DOWNTO 0) - powerup_y_pos(3 DOWNTO 0);
powerup_address <= x_addy & y_addy;
collect_lives <= flag;

powerup_on <= '1' when (
								(powerup_x_pos <= ('0' & pixel_column)) and
								((powerup_x_pos + ('0' & size)) > ('0' & pixel_column)) and
								(powerup_y_pos <= pixel_row) and
								((powerup_y_pos + size) > pixel_row)
								AND flag = '0' AND random_num < CONV_STD_LOGIC_VECTOR(240,8)
								) else '0';
			
	flag_proc : process(power_up_disable)
	begin
			if (reset = '1') then
				flag <= '0';
			elsif(power_up_disable = '1') then
				flag <= '1';
			end if;
		
	end process;
	
	spawn_proc : Process(clk)
	begin
		if(reset = '1') then
			spawn_timer <= 0;
			random_num <= CONV_STD_LOGIC_VECTOR(250,8);
		elsif (rising_edge(clk)) then
			spawn_timer <= spawn_timer + 1;
			if (spawn_timer = 250000000) then
				random_num <= random_in;
			end if;
		end if;
	end process;
	
END behavior;