LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;

ENTITY draw_main_screen is
	port(	--state : IN STD_LOGIC_VECTOR(2 downto 0);
			pixel_row, pixel_column : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			address : OUT STD_LOGIC_VECTOR(5 DOWNTO 0));
END ENTITY draw_main_screen;

ARCHITECTURE behaviour of draw_main_screen is
begin
	process(pixel_row, pixel_column)
	begin
		if(pixel_row >= "0000011111" and pixel_row <= "0000101111") then -- row 31 to 47
			if(pixel_column <= "0100010000") then -- <272
				address <= "100000"; -- space
			elsif (pixel_column <= "0100100000") then -- <288
				address <= "000110"; -- F
			elsif (pixel_column <= "0100110000") then	-- <304
				address <= "001100"; -- L
			elsif (pixel_column <= "0101000000") then -- <320
				address <= "000001"; -- A
			elsif (pixel_column <= "0101010000") then -- <336
				address <= "010000"; -- P
			elsif (pixel_column <= "0101100000") then -- <352
				address <= "010000"; -- P
			elsif (pixel_column <= "0101110000") then -- <368
				address <= "011001"; -- Y
			elsif (pixel_column <= "0110000000") then -- <384
				address <= "100000"; -- space
			end if;
		elsif(pixel_row >= "0000110000" and pixel_row <= "0000111110") then -- row 31 to 47
			if(pixel_column <= "0100010000") then -- <272
				address <= "100000"; -- space
			elsif (pixel_column <= "0100100000") then -- <288
				address <= "100000"; -- space
			elsif (pixel_column <= "0100110000") then	-- <304
				address <= "000010"; -- B
			elsif (pixel_column <= "0101000000") then -- <320
				address <= "001001"; -- I
			elsif (pixel_column <= "0101010000") then -- <336
				address <= "010010"; -- R
			elsif (pixel_column <= "0101100000") then -- <352
				address <= "000100"; -- D
			elsif (pixel_column <= "0101110000") then -- <368
				address <= "100000"; -- space
			elsif (pixel_column <= "0110000000") then -- <384
				address <= "100000"; -- space
			end if;
		elsif(pixel_row >= "0001001110" and pixel_row <= "0001011101") then -- row 31 to 47
			if(pixel_column <= "0100010000") then -- <272
				address <= "001110"; -- N
			elsif (pixel_column <= "0100100000") then -- <288
				address <= "000101"; -- E
			elsif (pixel_column <= "0100110000") then	-- <304
				address <= "010111"; -- W
			elsif (pixel_column <= "0101000000") then -- <320
				address <= "100000"; -- space
			elsif (pixel_column <= "0101010000") then -- <336
				address <= "000111"; -- G
			elsif (pixel_column <= "0101100000") then -- <352
				address <= "000001"; -- A
			elsif (pixel_column <= "0101110000") then -- <368
				address <= "001101"; -- M
			elsif (pixel_column <= "0110000000") then -- <384
				address <= "000101"; -- E
			end if;
		elsif (pixel_row >= "0001011110" and pixel_row <= "0001101101") then -- 48 to 62
			if(pixel_column <= "0100010000") then -- <272
				address <= "010000"; -- P
			elsif (pixel_column <= "0100100000") then -- <288
				address <= "010010"; -- R
			elsif (pixel_column <= "0100110000") then	-- <304
				address <= "000101"; -- E
			elsif (pixel_column <= "0101000000") then -- <320
				address <= "010011"; -- S
			elsif (pixel_column <= "0101010000") then -- <336
				address <= "010011"; -- S
			elsif (pixel_column <= "0101100000") then -- <352
				address <= "100000"; -- Space
			elsif (pixel_column <= "0101110000") then -- <368
				address <= "000010"; -- B
			elsif (pixel_column <= "0110000000") then -- <384
				address <= "110001"; -- 1
			end if;
		elsif (pixel_row >= "0001111110" and pixel_row <= "0010001101") then -- 78 to 93
			if (pixel_column <= "0011110000") then -- <240
				address <= "010100"; -- T
			elsif (pixel_column <= "0100000000") then -- <256
				address <= "010010"; -- R
			elsif (pixel_column <= "0100010000") then -- <272
				address <= "000001"; -- A
			elsif (pixel_column <= "0100100000") then -- <288
				address <= "001001"; -- I
			elsif (pixel_column <= "0100110000") then -- <304
				address <= "001110"; -- N
			elsif (pixel_column <= "0101000000") then -- <320
				address <= "001001"; -- I
			elsif (pixel_column <= "0101010000") then -- <336
				address <= "001110"; -- N middle
			elsif (pixel_column <= "0101100000") then -- <352	
				address <= "000111"; -- G
			elsif (pixel_column <= "0101110000") then -- <368
				address <= "100000"; -- Space
			elsif (pixel_column <= "0110000000") then -- <384
				address <= "001101"; -- M
			elsif (pixel_column <= "0110010000") then -- <400
				address <= "001111"; -- O
			elsif (pixel_column <= "0110100000") then -- <416
				address <= "000100"; -- D
			elsif (pixel_column <= "0110110000") then -- <432
				address <= "000101"; -- E
			end if;
		elsif (pixel_row >= "0010001110" and pixel_row <= "0010011101") then -- 94 to 109
			if(pixel_column <= "0100010000") then -- <296
				address <= "010000"; -- P
			elsif (pixel_column <= "0100100000") then -- <304
				address <= "010010"; -- R
			elsif (pixel_column <= "0100110000") then	-- <312
				address <= "000101"; -- E
			elsif (pixel_column <= "0101000000") then -- <320
				address <= "010011"; -- S
			elsif (pixel_column <= "0101010000") then -- <328
				address <= "010011"; -- S
			elsif (pixel_column <= "0101100000") then -- <336
				address <= "100000"; -- Space
			elsif (pixel_column <= "0101110000") then -- <344
				address <= "000010"; -- B
			elsif (pixel_column <= "0110000000") then -- <352
				address <= "110000"; -- 0
			end if;
		end if;
	end process;	
END behaviour;