library ieee;
use ieee.std_logic_1164.all;

entity tb_somador1 is
end entity;

architecture hibrida of tb_somador1 is
    signal a, b, cin, s,cout : std_logic;
    
begin

    s1b : entity work.fullad1(behavioral)
        port map (A=>a, B=> b, S=> s,CIN=> cin,COUT => cout);
    
    estimolo : process is
        type linha_tv is record
            a, b,cin,s,cout: std_logic;
        end record;
        type vet_linha_tv is array(0 to 7) of linha_tv;
        constant tabela_verdade : vet_linha_tv := 
    --     a   b  cin  s cout
        (('0','0','0','0','0'),
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

            assert s = tabela_verdade(i).s report "Erro";
            assert cout = tabela_verdade(i).cout report "Erro";
        end loop;
        
        report "Fim dos Testes";
        wait;
    end process estimolo;
end architecture;