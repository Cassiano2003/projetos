library ieee;
use ieee.std_logic_1164.all;

entity teste_s is
    generic (
        N : natural := 2
    );
end entity;

architecture rtl of teste_s is

    signal clk, data_in : std_logic;
    signal data_out : std_logic_vector(N-1 downto 0);

begin
    serialpralelo: entity work.serialtoparallel(structural)
    generic map (N)
    port map (serial_in => data_in,clk => clk,data_out => data_out);

    t: process is
        type struct_serial is record
            data_in : std_logic;
            clk : std_logic;
        end record;
        type vet_serial is array (natural range<>) of struct_serial;
        constant tabela : vet_serial := 
        (
            ('0','0'),
            ('1','1'),
            ('0','0'),
            ('1','1')
        );
        
    begin
        for i in tabela'range loop
            clk <= tabela(i).clk;
            data_in <= tabela(i).data_in;

            wait for 1 ns;
            report "Valor de data_out " & integer'image(i);
            report "Valor do clk " & std_logic'image(clk);
            for j in data_out'range loop
                report std_logic'image(data_out(j)); 
        
            end loop;
        end loop;
            report "Fim processo !!!";
        wait;
    end process t;

end architecture;