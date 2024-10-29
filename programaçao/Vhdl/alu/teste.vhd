library ieee;
use ieee.std_logic_1164.all;

entity teste is
    generic (
        N : natural := 8
    );
end entity;

architecture rtl of teste is

    signal entrada_1,entrada_2,saida: std_logic_vector(N-1 downto 0);
    signal op : std_logic_vector(2 downto 0);

begin
    t: entity work.alu(structural)
        generic map (N)
        port map (A => entrada_1, B => entrada_2, S => saida, C => op);

    presunto: process is
        type alu_struct is record
            entrada_1,entrada_2,saida: std_logic_vector(N-1 downto 0);
            op : std_logic_vector(2 downto 0);
        end record;
        type vet_alu is array (natural range<>) of alu_struct;
        constant tabela : vet_alu := 
        (
            ("11111111",    "00000001",     "00000000",     "001"),
            ("11110000",    "00000001",     "11101111",     "101"),
            ("00100010",    "00000101",     "00000000",     "000"),
            ("00010001",    "10000000",     "10010001",     "010")
        );
    begin
        for i in tabela'range loop
            entrada_1 <= tabela(i).entrada_1;
            entrada_2 <= tabela(i).entrada_2;
            op <= tabela(i).op;

            wait for 1 ns;

            assert saida = tabela(i).saida report "Erro !!! " & integer'image(i);
            
        end loop;
        
            report "Fim processo.";
            wait;
    end process;

end architecture;