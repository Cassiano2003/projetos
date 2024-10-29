library ieee;
use ieee.std_logic_1164.all;

entity reg_n is
    generic (
        N: natural := 1
    );
    port (
        data_in: in std_logic_vector(N-1 downto 0);
        clk: in std_logic;
        data_out: out std_logic_vector(N-1 downto 0)
    );
end entity;

architecture behavioral of reg_n is
begin
    process (clk)
    begin
        if clk = '1' then 
            data_out <= data_in;
        else
            data_out <= (0 => 'H',others => '0'); 
        end if;
    end process;
end architecture;
