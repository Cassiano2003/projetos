library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;

entity washcontrol is
    port (
        inicia, cheia, tempo, vazia: in std_logic;
        clock: in std_logic;
        
        entrada_agua: out std_logic;
        aciona_motor: out std_logic;
        saida_agua: out std_logic
    );
end entity;

architecture behavioral of washcontrol is
    type state_type is (O,E,C,V,F);
    signal atual, prox : state_type;
begin

    process (inicia,clock)
    begin
        if (inicia = '0') then
            atual <= O;
        elsif (rising_edge(clock)) then
            atual <= prox;
        end if;
    end process;
    
    --Faz a selecao de qual sera o estado atual
    process (atual,inicia,cheia, tempo, vazia)
    begin
        case atual is
            --Ociosa
            when O =>
                if(inicia = '1') then
                    prox <= E;
                end if;
                entrada_agua <= '0';
                aciona_motor <= '0';
                saida_agua <= '0';
            --Enchendo
            when E =>
                if cheia = '1' then
                    prox <= C;
                end if;
                entrada_agua <= '1';
                aciona_motor <= '0';
                saida_agua <= '0';
            --Cheia
            when C =>
                if tempo = '1' then
                    prox <= V;
                end if;
                entrada_agua <= '0';
                aciona_motor <= '1';
                saida_agua <= '0';
            --Esvasiando
            when V =>
                if vazia = '1' then
                    prox <= F;
                end if;
                entrada_agua <= '0';
                aciona_motor <= '0';
                saida_agua <= '1';
            --Fim
            when F =>
                if inicia = '0' then
                    prox <= O;
                end if;
                entrada_agua <= '0';
                aciona_motor <= '0';
                saida_agua <= '0';
        end case;
    end process;

end architecture;
