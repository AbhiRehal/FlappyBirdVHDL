LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;

entity score_level_manager is
	port (level : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			state : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			score : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			pixel_row, pixel_column : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			hp		: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			address : OUT STD_LOGIC_VECTOR(5 DOWNTO 0));
end entity score_level_manager;

architecture behaviour of score_level_manager is

begin
	process (pixel_row, pixel_column)
	begin	
		if (level = "00") then
			if(pixel_row >= "0000011111" and pixel_row <= "0000101111") then -- row 31 to 47
					if (pixel_column <= "0011000000") then -- <192
						address <= "001100"; -- L
					elsif (pixel_column <= "0011010000") then -- <208
						address <= "000101"; -- E
					elsif (pixel_column <= "0011100000") then -- <224
						address <= "010110"; -- V
					elsif (pixel_column <= "0011110000") then -- <240
						address <= "000101"; -- E
					elsif (pixel_column <= "0100000000") then -- <256
						address <= "001100"; -- L
					elsif (pixel_column <= "0100010000") then -- <272
						address <= "100000"; -- space
					elsif (pixel_column <= "0100100000") then -- <288
						address <= "110001"; -- 1
					elsif (pixel_column <= "0100110000") then	-- <304
						address <= "101101"; -- hyphon
					end if;
			end if;
		elsif (level = "01") then
			if(pixel_row >= "0000011111" and pixel_row <= "0000101111") then -- row 31 to 47
					if (pixel_column <= "0011000000") then -- <192
						address <= "001100"; -- L
					elsif (pixel_column <= "0011010000") then -- <208
						address <= "000101"; -- E
					elsif (pixel_column <= "0011100000") then -- <224
						address <= "010110"; -- V
					elsif (pixel_column <= "0011110000") then -- <240
						address <= "000101"; -- E
					elsif (pixel_column <= "0100000000") then -- <256
						address <= "001100"; -- L
					elsif (pixel_column <= "0100010000") then -- <272
						address <= "100000"; -- space
					elsif (pixel_column <= "0100100000") then -- <288
						address <= "110010"; -- 2
					elsif (pixel_column <= "0100110000") then	-- <304
						address <= "101101"; -- hyphon
					end if;
			end if;
		elsif (level = "10") then
			if(pixel_row >= "0000011111" and pixel_row <= "0000101111") then -- row 31 to 47
					if (pixel_column <= "0011000000") then -- <192
						address <= "001100"; -- L
					elsif (pixel_column <= "0011010000") then -- <208
						address <= "000101"; -- E
					elsif (pixel_column <= "0011100000") then -- <224
						address <= "010110"; -- V
					elsif (pixel_column <= "0011110000") then -- <240
						address <= "000101"; -- E
					elsif (pixel_column <= "0100000000") then -- <256
						address <= "001100"; -- L
					elsif (pixel_column <= "0100010000") then -- <272
						address <= "100000"; -- space
					elsif (pixel_column <= "0100100000") then -- <288
						address <= "110011"; -- 3
					elsif (pixel_column <= "0100110000") then	-- <304
						address <= "101101"; -- hyphon
					end if;
			end if;
		end if;
		
		if (state = "10") then
			if(pixel_row >= "0000011111" and pixel_row <= "0000101111") then -- row 31 to 47
					if (pixel_column <= "0011000000") then -- <192
						address <= "010100"; -- T
					elsif (pixel_column <= "0011010000") then -- <208
						address <= "010010"; -- R
					elsif (pixel_column <= "0011100000") then -- <224
						address <= "000001"; -- A
					elsif (pixel_column <= "0011110000") then -- <240
						address <= "001001"; -- I
					elsif (pixel_column <= "0100000000") then -- <256
						address <= "001110"; -- N
					elsif (pixel_column <= "0100010000") then -- <272
						address <= "001001"; -- I
					elsif (pixel_column <= "0100100000") then -- <288
						address <= "001110"; -- N
					elsif (pixel_column <= "0100110000") then	-- <304
						address <= "000111"; -- G
					end if;
			end if;		
		end if;

		if (state = "01") then
			if(pixel_column >= "0100110001") then -- 305
				if (score = "00000") then
					address <= "110000"; -- 0	
				elsif (score = "00001") then
					if (pixel_column <= "0101000000") then -- 320
						address <= "110000";
					else
						address <= "110001"; -- 1
					end if;
				elsif (score = "00010") then
					if (pixel_column <= "0101000000") then
						address <= "110000";
					else
						address <= "110010"; -- 2
					end if;	
				elsif (score = "00011") then
					if (pixel_column <= "0101000000") then
						address <= "110000";
					else
						address <= "110011"; -- 3
					end if;		
				elsif (score = "00100") then
					if (pixel_column <= "0101000000") then
						address <= "110000";
					else
						address <= "110100"; -- 4
					end if;	
				elsif (score = "00101") then
					if (pixel_column <= "0101000000") then
						address <= "110000";
					else
						address <= "110101"; -- 5
					end if;
				elsif (score = "00110") then
					if (pixel_column <= "0101000000") then
						address <= "110000";
					else
						address <= "110110"; -- 6
					end if;
				elsif (score = "00111") then
					if (pixel_column <= "0101000000") then
						address <= "110000";
					else
						address <= "110111"; -- 7
					end if;
				elsif (score = "01000") then
					if (pixel_column <= "0101000000") then
						address <= "110000";
					else
						address <= "111000"; -- 8
					end if;
				elsif (score = "01001") then
					if (pixel_column <= "0101000000") then
						address <= "110000";
					else
						address <= "111001"; -- 9
					end if;
				elsif (score = "01010") then
					if (pixel_column <= "0101000000") then
						address <= "110001";
					else
						address <= "110000"; -- 10
					end if;
				elsif (score = "01011") then
					address <= "110001"; -- 11
				elsif (score = "01100") then
					if (pixel_column <= "0101000000") then
						address <= "110001";
					else
						address <= "110010"; -- 12
					end if;
				elsif (score = "01101") then
					if (pixel_column <= "0101000000") then
						address <= "110001";
					else
						address <= "110011"; -- 13
					end if;
				elsif (score = "01110") then
					if (pixel_column <= "0101000000") then
						address <= "110001";
					else
						address <= "110100"; -- 14
					end if;
				elsif (score = "01111") then
					if (pixel_column <= "0101000000") then
						address <= "110001";
					else
						address <= "110101"; -- 15
					end if;
				elsif (score = "10000") then
					if (pixel_column <= "0101000000") then
						address <= "110001";
					else
						address <= "110110"; -- 16
					end if;
				elsif (score = "10001") then
					if (pixel_column <= "0101000000") then
						address <= "110001";
					else
						address <= "110111"; -- 17
					end if;
				elsif (score = "10010") then
					if (pixel_column <= "0101000000") then
						address <= "110001";
					else
						address <= "111000"; -- 18
					end if;
				elsif (score = "10011") then
					if (pixel_column <= "0101000000") then
						address <= "110001";
					else
						address <= "111001"; -- 19
					end if;
				elsif (score = "10100") then
					if (pixel_column <= "0101000000") then
						address <= "110010";
					else
						address <= "110000"; -- 20
					end if;
				end if;
			end if;
			
			if (hp = "11") then
				if (pixel_column >= "0110000000") then
					address <= "111111";
				end if;
			elsif (hp = "10") then
				if (pixel_column >= "0110011111") then
					address <= "100000";
				elsif (pixel_column >= "0110000000") then
					address <= "111111";
				end if;
			elsif (hp = "01") then
				if (pixel_column >= "0110001111" ) then
					address <= "100000";
				elsif (pixel_column >= "0110000000") then
					address <= "111111";
				end if;
			else
				address <= "100000";
			end if;
		else
			if(pixel_column >= "0100110001") then
				address <= "100000";
			end if;
			if (hp = "11") then
				if (pixel_column >= "0110000000") then
					address <= "111111";
				end if;
			elsif (hp = "10") then
				if (pixel_column >= "0110011111") then
					address <= "100000";
				elsif (pixel_column >= "0110000000") then
					address <= "111111";
				end if;
			elsif (hp = "01") then
				if (pixel_column >= "0110001111" ) then
					address <= "100000";
				elsif (pixel_column >= "0110000000") then
					address <= "111111";
				end if;
			else
				address <= "100000";
			end if;
		end if;
		
	end process;
end behaviour;