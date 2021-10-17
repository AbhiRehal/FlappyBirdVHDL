LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;

ENTITY death_screen_filter is
	port(pix_row, pix_col : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			enable : OUT STD_LOGIC);
END ENTITY death_screen_filter;

ARCHITECTURE behaviour of death_screen_filter is

begin
	enable <= '1' when((pix_col >= "0100000000" and pix_col <= "0110000000") AND (pix_row >= "0000011111" and pix_row <= "0000111110")) else '0';
END behaviour;