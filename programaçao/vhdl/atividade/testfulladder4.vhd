library ieee;
use ieee.std_logic_1164.all;

entity testfulladder4 is
end entity;


architecture rtl of testfulladder4 is
    signal a,b,s:std_logic_vector(3 downto 0);
    signal cout:std_logic;
begin

    fa4: entity work.fulladder4(structural)
        port map(A => a, B => b,CIN => '0', S => s, COUT =>cout);
    
    addd4: process is
        type tb_somador4 is record
            a,b,s :std_logic_vector(3 downto 0);
            cout:std_logic;  
        end record;
        type vet_somador4_tv is array (natural range<>) of tb_somador4;
        constant tabela_verdade : vet_somador4_tv :=
        (   ("0000","0000","0000",'0'),
            ("0011","0011","0110",'0'),
            ("0101","0011","1000",'0'),
            ("1111","0001","0000",'1'));
    begin
        for i in tabela_verdade'range loop
            a <= tabela_verdade(i).a;
            b <= tabela_verdade(i).b;
        
            wait for 1 ns;

            assert s = tabela_verdade(i).s report "ERRO";
            assert cout = tabela_verdade(i).cout report "ERRO";
        end loop;

            report "FIM PROCESO !!!";
        wait;
    end process addd4;
end architecture;