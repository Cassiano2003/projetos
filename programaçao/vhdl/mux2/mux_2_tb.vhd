entity mux_2_tb is
end mux_2_tb;

architecture teste of mux_2_tb is
    signal d0, d1, c, r: bit;
    begin
        m2: entity work.mux_2(dataflow)
            port map (d0 => d0,d1 => d1,c => c,r => r);
        estimulo_checagem : process is
            type linha_tv is record
                d0,d1,c,r : bit;
            end record;
            type vet_linha_tv is array (0 to 7) of linha_tv;
            constant tabela_verdade : vet_linha_tv := 
            (
            --    d0, d1, c,  r
                ('0','0','0','0'),
                ('0','0','1','0'),
                ('0','1','0','0'),
                ('0','1','1','1'),
                ('1','0','0','1'),
                ('1','0','1','0'),
                ('1','1','0','1'),
                ('1','1','1','1')
            );
        begin
            for i in tabela_verdade'range loop
                d0 <= tabela_verdade(i).d0;
                d1 <= tabela_verdade(i).d1;
                c <= tabela_verdade(i).c;
            
            wait for 1 ns;

            assert r = tabela_verdade(i).r report "ERRO" & integer'image(i);
        end loop;
            
            report "Fim Teste";

            wait;
    end process estimulo_checagem ;
end;