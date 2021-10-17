LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;

entity counter is
    Port ( rst, clk : in std_logic;
           output: out std_logic_vector(4 DOWNTO 0));
end counter;

architecture count_arch of counter is
   signal count : std_logic_vector(4 DOWNTO 0);
    begin
	 
      process(rst,clk)
        begin
          if (rst = '1') then
				count <= CONV_STD_LOGIC_VECTOR(0,5);
          elsif (rising_edge(clk)) then
				count <= count + 1;
				if (count = CONV_STD_LOGIC_VECTOR(21,5)) then
					count <= CONV_STD_LOGIC_VECTOR(0,5);
				end if;
          end if;
      end process;
      output <= count;
		
end count_arch;