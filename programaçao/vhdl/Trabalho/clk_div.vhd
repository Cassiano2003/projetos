library ieee;
use ieee.std_logic_1164.all;

entity clk_div is
	generic ( N : natural );
	port (
		clk:         in std_logic;
		clk_divided: out std_logic
	);
end entity;

architecture behavioral of clk_div is
	signal clk_gen : std_logic := '0';
begin
	
	clk_divided <= clk_gen;
	
	process (clk)
		variable counter: natural range 0 to N := 0;
	begin
		if ( rising_edge(clk) ) then
			counter := counter + 1;
			
			if ( counter >= (N-1)/2 ) then
				counter := 0;
				clk_gen <= not clk_gen;
			end if;
		end if;
	end process;
end architecture;
