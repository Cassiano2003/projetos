library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity teste_trava is
    generic (
        --Crio dois genericos para facilitar as trocas de valores
        senha : natural range 0 to 255 := 10;
        tempo_para_desarme : natural range 0 to 255 := 30
    );
end entity;

architecture rtl of teste_trava is

    --Sinais para a instanciaçao da entidade Trava
    signal input,segundos : std_logic_vector (7 downto 0);
    signal clk, trava, reset : std_logic;
    --Gera o sinal de clk
    signal gera_clk : std_logic := '0';

begin

    --Estanciaçaod a entidade Trava
    trava_0: entity work.Trava(arq_trava)
    generic map (senha => senha, tempo_para_desarme => tempo_para_desarme)
    port map (input => input, segundos => segundos, clk => clk, trava_0 => trava, reset => reset);

    --Processo pra gerar os valore
    travas: process is
    begin
        --For para gerar um serto tempo para fazer os testes
        for i in 0 to tempo_para_desarme*4 loop
            if i < tempo_para_desarme-10 or i = tempo_para_desarme then --Inicia o resete em 1 e depois reseta de novo para mais testes
                reset <= '1';
            else
                reset <= '0';
            end if;

            if i = tempo_para_desarme-20 or i = tempo_para_desarme*4 or i = tempo_para_desarme then --Usa a senha em determinados pontos
                input <= std_logic_vector(to_unsigned(senha,input'length));
            else --Fica testando varias senhas diferentes em tempos diferentes
                input <= std_logic_vector(to_unsigned(i,input'length));
            end if;
            --Faz o sinal do clk
            clk <= gera_clk;
            gera_clk <= not gera_clk;

            wait for 1 ns;

        end loop;
            report "Fim processo !!!";
        wait;
    end process travas;
    
end architecture;