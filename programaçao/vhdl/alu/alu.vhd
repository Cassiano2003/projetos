library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
    generic( 
        N: natural := 8 
    );
    port(
        A, B: in std_logic_vector(N-1 downto 0);
        C: in std_logic_vector(2 downto 0);
        S: out std_logic_vector(N-1 downto 0)
    );
end entity;

architecture structural of alu is
    signal aux_s1, aux_s2: std_logic_vector(N-1 downto 0);

begin
    
    orand1: entity work.andor(behavioral)
    generic map (N)
        port map (A => A, B => B, operation => C(1),S => aux_s2);
        
    addsub1: entity work.addsub(behavioral)
        generic map (N)
        port map (A => A, B => B,operation => C(2), S => aux_s1);

    
    mux: entity work.multiplex2x1(behavioral)
        generic map (N)
        port map (input0 => aux_s2,input1 => aux_s1, sel => C(0), output => S);

end architecture;
