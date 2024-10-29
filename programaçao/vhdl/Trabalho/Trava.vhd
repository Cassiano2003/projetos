--Declaraçao da biblioteca
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


--Declaraçao das entradas, saidas e genericos
entity Trava is
    generic (
        senha : natural range 0 to 255 := 0;
        tempo_para_desarme : natural range 0 to 255 := 30
    );
    port (
        clk   : in std_logic;
        reset : in std_logic;
        input : in std_logic_vector (7 downto 0);
        segundos : out std_logic_vector (7 downto 0); 
        trava_0 : out std_logic
    );
end entity;

--Arquetetura

architecture arq_trava of Trava is

    --Sinais auxiliares
    signal aux_segundos : std_logic_vector (7 downto 0);
    signal aux_input_0 : std_logic := '1';
    signal aux_input_1 : std_logic := '1';

begin
    --Proceso que faz o reset e a decrementaçao do tempo
    process (clk,reset)
        variable cont : natural range 0 to 255 := tempo_para_desarme;
    begin
        if reset = '1' then
            cont := tempo_para_desarme;
        elsif cont /= 0 then
            if rising_edge(clk) and aux_input_1 = '1' then
                cont := cont - 1;
            end if;
        end if;
        aux_segundos <= std_logic_vector(to_unsigned(cont,aux_segundos'length));
    end process;

    --Processo que vai comparar a senha pra ver se esta coreta
    process (input)
    begin
        if to_integer(unsigned(aux_segundos)) > 0 then
            if senha = to_integer(unsigned(input)) then
                aux_input_1 <= '0';
            else
                aux_input_1 <= '1';
            end if;
        end if;

        
    end process;
    
    segundos <= aux_segundos;
    trava_0 <= aux_input_0 when reset = '1' else aux_input_1;

end architecture;