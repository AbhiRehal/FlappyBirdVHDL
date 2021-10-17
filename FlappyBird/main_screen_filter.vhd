LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;

ENTITY main_screen_filter is
	port(pix_row, pix_col : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			enable : OUT STD_LOGIC);
END ENTITY main_screen_filter;

ARCHITECTURE behaviour of main_screen_filter is

begin
	enable <= '1' when(((pix_col >= "0100000000" and pix_col <= "0110000000") AND (pix_row >= "0000011111" and pix_row <= "0000111110")) OR -- flappy bird
							  ((pix_col >= "0100000000" and pix_col <= "0110000000") AND (pix_row >= "0001001110" and pix_row <= "0001101101")) OR -- new game press b1
							  ((pix_col >= "0011100000" and pix_col <= "0110110000") AND (pix_row >= "0001111110" and pix_row <= "0010001101")) OR -- training
							  ((pix_col >= "0100000000" and pix_col <= "0110000000") AND (pix_row >= "0010001110" and pix_row <= "0010011101")) -- press b2
							) else '0';
END behaviour;