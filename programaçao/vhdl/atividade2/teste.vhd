library ieee;
use ieee.std_logic_1164.all;

entity teste is
end entity;

architecture rtl of teste is
    signal din, dout : std_logic_vector (3 downto 0);
    signal desloc : std_logic_vector (1 downto 0);
    signal shift: std_logic;
    
begin
    rotaciona: entity work.shiftrotater(structural)
    port map (din => din,desloc => desloc, shift => shift, dout => dout);
    t: process is
        type tb_shift is record
            shift: std_logic;
            desloc : std_logic_vector (1 downto 0);
            din, dout : std_logic_vector (3 downto 0);
        end record;
        type vet_shift is array (natural range <>) of tb_shift;
        constant tabela_verdade : vet_shift :=
        (
            --shift desloc(1,0) din(3,2,1,0) dout(3,2,1,0)
            ('0',       "00",       "0011",       "0011"),
            ('0',       "01",       "0001",       "0010"),
            ('0',       "10",       "1101",       "0111"),
            ('0',       "11",       "0101",       "1010"),
            ('1',       "00",       "0100",       "0100"),
            ('1',       "01",       "1111",       "1110"),
            ('1',       "10",       "0011",       "1100"),
            ('1',       "11",       "0101",       "1000")
        );
    begin
        for i in tabela_verdade'range loop
            shift <= tabela_verdade(i).shift;
            din <= tabela_verdade(i).din;
            desloc <= tabela_verdade(i).desloc;
            wait for 1 ns;

            assert dout = tabela_verdade(i).dout report "ERRO " & integer'image(i);
        end loop;
            report "Fim proceso !!!";
        wait;
    end process t;

end architecture;