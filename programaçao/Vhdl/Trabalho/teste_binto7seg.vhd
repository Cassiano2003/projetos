library ieee;
use ieee.std_logic_1164.all;

entity teste_binto7seg is
end entity;

architecture rtl of teste_binto7seg is

    signal input : std_logic_vector (3 downto 0);
    signal display : std_logic_vector (6 downto 0);
begin

    bint: entity work.binto7seg(behavioral)
    port map (input => input,display => display);

    bint7: process is 
        type strutura is record
            input :std_logic_vector (3 downto 0);
            display : std_logic_vector (6 downto 0);
        end record;
        type tv_binto is array(natural range <> ) of strutura;
        constant  tabela :tv_binto := 
        ( 
            ("0000","0000000"), -- 0  
            ("0001","0000000"), -- 1
            ("0010","0000000"),-- 2
            ("0011","0000000"),-- 3
            ("0100","0000000"),-- 4
            ("0101","0000000"),-- 5
            ("0110","0000000"),-- 6
            ("0111","0000000"),-- 7
            ("1000","0000000"),-- 8
            ("1001","0000000"),-- 9
            ("1010","0000000"),-- letra A(10 em hex) 
            ("1011","0000000"),-- letra b(11 em hex)
            ("1100","0000000"),-- letra C(12 em hex)
            ("1101","0000000"), -- letra d(13 em hex)
            ("1110","0000000"), -- letra E(14 em hex)
            ("1111","0000000") -- letra F (15 em hex)

        );
        begin
            for i in tabela'range loop
                input <= tabela(i).input;
                wait for 1 ns;
            end loop;
                report "fim do processo !!!";
            wait;
    end process bint7;
end architecture;