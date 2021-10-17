LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;

ENTITY draw_death_screen is
	port(	--state : IN STD_LOGIC_VECTOR(2 downto 0);
			pixel_row, pixel_column : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			address : OUT STD_LOGIC_VECTOR(5 DOWNTO 0));
END ENTITY draw_death_screen;

ARCHITECTURE behaviour of draw_death_screen is
begin
	process(pixel_row, pixel_column)
	begin
		if(pixel_row >= "0000011111" and pixel_row <= "0000101111") then -- row 31 to 47
			if(pixel_column <= "0100010000") then -- <272
				address <= "100000"; -- space
			elsif (pixel_column <= "0100100000") then -- <288
				address <= "100000"; -- space
			elsif (pixel_column <= "0100110000") then	-- <304
				address <= "000111"; -- G
			elsif (pixel_column <= "0101000000") then -- <320
				address <= "000001"; -- A
			elsif (pixel_column <= "0101010000") then -- <336
				address <= "001101"; -- M
			elsif (pixel_column <= "0101100000") then -- <352
				address <= "000101"; -- E
			elsif (pixel_column <= "0101110000") then -- <368
				address <= "100000"; -- space
			elsif (pixel_column <= "0110000000") then -- <384
				address <= "100000"; -- space
			end if;
		elsif(pixel_row >= "0000110000" and pixel_row <= "0000111110") then -- row 31 to 47
			if(pixel_column <= "0100010000") then -- <272
				address <= "100000"; -- space
			elsif (pixel_column <= "0100100000") then -- <288
				address <= "100000"; -- space
			elsif (pixel_column <= "0100110000") then	-- <304
				address <= "001111"; -- O
			elsif (pixel_column <= "0101000000") then -- <320
				address <= "010110"; -- V
			elsif (pixel_column <= "0101010000") then -- <336
				address <= "000101"; -- E
			elsif (pixel_column <= "0101100000") then -- <352
				address <= "010010"; -- R
			elsif (pixel_column <= "0101110000") then -- <368
				address <= "100000"; -- space
			elsif (pixel_column <= "0110000000") then -- <384
				address <= "100000"; -- space
			end if;
		end if;
	end process;	
END behaviour;