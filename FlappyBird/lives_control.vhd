LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;

entity lives_control is
	port(reset, collision, clk : in std_logic;
			
		  dead: out std_logic;
		  hp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
end entity lives_control;

architecture lives_arc of lives_control is
signal lives_counter : STD_LOGIC_VECTOR(1 downto 0) := "11";

begin
	process (clk, collision)
	begin
	if (rising_edge(clk)) then
		if(reset = '1') then
			dead <= '0';
			lives_counter <= "11";
		else
			if (lives_counter = "00") then
				dead <= '1';
			elsif(collision = '1') then
				lives_counter <= lives_counter - 1;
				dead <= '0';
			else
				dead <= '0';
			end if;
		end if;
	end if;
	hp <= lives_counter;
	end process;

end architecture lives_arc;