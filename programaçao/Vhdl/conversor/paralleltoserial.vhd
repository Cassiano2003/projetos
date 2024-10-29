library ieee;
use ieee.std_logic_1164.all;

entity paralleltoserial is
    generic( 
        N: natural := 8
    );
    port(
        data_in: in std_logic_vector(N-1 downto 0);
        serialize_load: in std_logic; -- 1 = serialize, 0 = load
        clk: in std_logic;
        serial_out: out std_logic
    );
end entity;

architecture structural of paralleltoserial is

    signal load : std_logic_vector(0 downto 0) := (0 => not serialize_load);

begin

    serial: for i in 0 to N-1 generate
        signal aux: std_logic;
    begin
        serial_2: if i = 0 generate
            flip_0: entity work.reg_n(behavioral)
            generic map(1)
            port map(data_in => load(0) and data_in(0), clk => clk, data_out => aux);
        end generate;

        flip_i: entity work.reg_n(behavioral)
        generic map(1)
        port map(data_in => ((aux and serialize_load) or (load(0) and data_in(i))), clk => clk, data_out => aux);

        serial_out <= aux;
    end generate;

end architecture;
