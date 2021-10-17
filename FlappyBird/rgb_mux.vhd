LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;

entity rgb_mux is
	port(bird, pipe, score, powerup: in std_logic;
			sprite : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			sprite_power_up : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		  rgb	: OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
		  dead, powerup_hit: out std_logic);
end entity rgb_mux;

architecture comparator_arc of rgb_mux is
SIGNAL red, green, blue : STD_LOGIC_VECTOR(3 DOWNTO 0);
begin
	process (bird, pipe, score)
	begin
		if (score = '1') then
			red <= "0000";
			green <= "0000";
			blue <= "0000";
			dead <= '0';
			powerup_hit <= '0';
		elsif (powerup = '1' and bird = '1') then
			red <= "1111";
			green <= "1111";
			blue <= "0000";
			dead <= '0';
			powerup_hit <= '1';
		elsif (powerup = '1') then
			red <= sprite_power_up(11 DOWNTO 8);
			green <= sprite_power_up(7 DOWNTO 4);
			blue <= sprite_power_up(3 DOWNTO 0);
			dead <= '0';
			powerup_hit <= '0';
		elsif (bird = '1' and pipe = '1') then
			red <= "0000";
			green <= "0000";
			blue <= "0000";
			dead <= '1';
			powerup_hit <= '0';
		elsif (bird = '1') then
			red <= sprite(11 DOWNTO 8);
			green <= sprite(7 DOWNTO 4);
			blue <= sprite(3 DOWNTO 0);
			dead <= '0';
			powerup_hit <= '0';
		elsif (pipe = '1') then
			red <= "0000";
			green <= "1111";
			blue <= "0000";
			dead <= '0';
			powerup_hit <= '0';
		else
			red <= "1111";
			green <= "1111";
			blue <= "1111";
			dead <= '0';
			powerup_hit <= '0';
		end if;
	end process;
	rgb <= (red & green & blue);
end architecture comparator_arc;