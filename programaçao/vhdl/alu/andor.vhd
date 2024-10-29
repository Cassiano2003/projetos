library ieee;
use ieee.std_logic_1164.all;

entity andor is
    generic (
        N: natural := 6
    );
    port (
        A, B: in std_logic_vector(N-1 downto 0);
        operation: in std_logic;
        S: out std_logic_vector(N-1 downto 0)
    );
end entity;

architecture behavioral of andor is
    signal or1 ,and1  : std_logic_vector(N-1 downto 0);
begin

    or1 <= A or B;
    and1 <= A and B;
    
    S <= and1 when operation = '0' else or1;

end architecture;
