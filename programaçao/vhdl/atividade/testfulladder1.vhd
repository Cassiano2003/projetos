library ieee;
use ieee.std_logic_1164.all;

entity testfulladder1 is
end entity;

architecture rtl of testfulladder1 is
    signal a,b,cin,s,cout :std_logic;    
begin

    fa1: entity work.fulladder1(behavioral)
        port map(A => a, B => b, CIN => cin, S => s, COUT =>cout);
    
    presunto: process is
        type tb_somador1 is record
            a,b,cin,s,cout :std_logic;
        end record;
        type vet_somador1_tv is array (0 to 7) of tb_somador1;
        constant tabela_verdade : vet_somador1_tv :=
        (   ('0','0','0','0','0'),
            ('0','0','1','1','0'),
            ('0','1','0','1','0'),
            ('0','1','1','0','1'),
            ('1','0','0','1','0'),
            ('1','0','1','0','1'),
            ('1','1','0','0','1'),
            ('1','1','1','1','1'));
    begin
        for i in tabela_verdade'range loop
            a <= tabela_verdade(i).a;
            b <= tabela_verdade(i).b;
            cin <= tabela_verdade(i).cin;
        
            wait for 1 ns;
            assert s = tabela_verdade(i).s report "ERRO";
            assert cout = tabela_verdade(i).cout report "ERRO";
        end loop;

            report "FIM PROCESO !!!";
        wait;
    end process presunto;
end architecture;