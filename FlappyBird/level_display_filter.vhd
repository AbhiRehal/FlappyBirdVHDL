LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;

ENTITY level_display_filter is
	port(pix_row, pix_col : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			enable : OUT STD_LOGIC);
END ENTITY level_display_filter;

ARCHITECTURE behaviour of level_display_filter is

begin
	--enable <= '1' when ((pix_col >= "0100110000" and pix_col <= "0101010000") AND (pix_row >= "0000011111" and pix_row <= "0000101111")) else '0';
	enable <= '1' when (((pix_col >= "0010110000" and pix_col <= "0101000000") AND (pix_row >= "0000011111" and pix_row <= "0000101111"))
								OR ((pix_col >= "0101000001" and pix_col <= "0101010000") and (pix_row >= "0000011111" and pix_row <= "0000101111"))
								OR ((pix_col >= "0110000000" and pix_col <= "0110101110") and (pix_row >= "0000100000" and pix_row <= "0000101111"))
								--OR ((pix_col >= "0110010000" and pix_col <= "0111000000") and (pix_row >= "0000011111" and pix_row <= "0000101111"))
								) else '0';
END behaviour;