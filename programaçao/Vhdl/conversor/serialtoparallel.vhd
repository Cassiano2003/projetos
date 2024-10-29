library ieee;
use ieee.std_logic_1164.all;

entity serialtoparallel is
    generic (
        N: natural := 8
    );
    port (
        serial_in: in std_logic;
        clk: in std_logic;
        data_out: out std_logic_vector(N-1 downto 0)
    );
end entity;

architecture structural of serialtoparallel is
    signal aux_1 : std_logic_vector(N-1 downto 0) := (others => '0');
begin
    gera_0: for j in 0 to N-1 generate
    begin

        if_1: if j < N-1 generate
            aux_1(j) <= aux_1(j+1) when clk = '1';
        end generate;

        if_0: if j = N-1 generate
            aux_1(j) <= serial_in when clk = '1';
        end generate;

    end generate;
        
    flip: entity work.reg_n(behavioral)
    generic map(N)
    port map(data_in => aux_1,clk => clk,data_out => data_out);
        
    
end architecture;
