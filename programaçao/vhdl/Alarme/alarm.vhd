library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;

entity alarm is
    generic (
        N: natural
    );
    port (
        sensors: in std_logic_vector(0 to N-1);
        key: in std_logic;
        clock: in std_logic;
        siren: out std_logic
    );
end entity;

architecture behavioral of alarm is
    type state_type is (D,LI,L,M,B);
    signal atual, prox : state_type;
    signal tempo : natural range 0 to 31 := 0;
begin

    --Faz a atualizacao de estados e soma o contador
    process (key,clock)
    begin
        if (key = '0') then
            atual <= D;
        elsif (rising_edge(clock)) then
            if atual = LI or atual = M then
                tempo <= tempo + 1;
            else
                tempo <= 0;
            end if;
            atual <= prox;
        end if;
    end process;
    
    --Faz a selecao de qual sera o estado atual
    process (sensors,atual,tempo)
    begin
        case atual is
            --Desligado
            when D =>
                if(key = '0') then
                    prox <= D;
                else
                    prox <= LI;
                end if;
                siren <= '0';
            --Ligando
            when LI =>
                if tempo < 30 then
                    prox <= LI;
                else
                    prox <= L;
                end if;
                siren <= '0';
            --Ligado
            when L =>
                if (OR_REDUCE(sensors) = '1') then
                    prox <= M;
                else
                    prox <= L;
                end if;
                siren <= '0';
            --Movimentando
            when M =>
                if tempo < 30 then
                    prox <= M;
                else
                    prox <= B;
                end if;
                siren <= '0';
            --Barulho
            when B =>
                if key = '1' then
                    prox <= B;
                end if;
                siren <= '1';
            when others =>
                null;
        end case;
    end process;

end architecture;
