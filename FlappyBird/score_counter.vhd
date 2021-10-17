LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;

ENTITY score_counter is
	port (reset, increase_count, start_next_level : IN STD_LOGIC;
			state : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			score : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
			speed: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			reset_pipes_next_level : OUT STD_LOGIC);
END ENTITY score_counter;

ARCHITECTURE behaviour of score_counter is
begin
	process(reset, increase_count, start_next_level)
	variable temp : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000";
	variable temp_state : STD_LOGIC_VECTOR(1 DOWNTO 0);
	variable flag : STD_LOGIC;
	variable reset_signal : STD_LOGIC;
	begin
	
	if (state = "01") then
		if (reset = '1') then
			temp := "00000";
			temp_state := "00";
			flag := '0';
			reset_signal := '0';
			reset_pipes_next_level <= '0';
		elsif(rising_edge(increase_count)) then
			if (temp = "10100") then -- when counter = 20 reset to 0
				temp := "00000"; -- sets counter back to 0
				--reset_pipes_next_level <= '1';
				reset_signal := '1'; -- sends signal to pipe to reset them before incrementing speed
				if(flag = '0') then -- if the pipes have been reset once already, then the speed is set to 11 otherwise 10
					temp_state := "01";
					flag := '1'; -- sets flag to know if pipes have been reset once already
				else
					temp_state := "10";
				end if;
			else
				--reset_pipes_next_level <= '0';
				reset_signal := '0';
				temp := temp + "00001";
			end if;
		end if;
		
		if (start_next_level = '1') then
			temp := "00000";
			reset_signal := '0';
		end if;
	end if;	
		score <= temp;
		speed <= temp_state;
		reset_pipes_next_level <= reset_signal;
		
	end process;
END behaviour;