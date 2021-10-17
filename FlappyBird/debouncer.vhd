LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;

entity debouncer is
	port(clk, sig: in std_logic;
		  output: out std_logic);
end entity debouncer;

architecture behaviour of debouncer is
begin
	process (clk, sig)
	variable temp : STD_LOGIC;
	begin
		if (rising_edge(clk)) then
			if (temp = '0' and sig = '1') then
				output <= '1';
			else
				output <= '0';
			end if;
			temp := sig;
		end if;
	end process;
end architecture behaviour;