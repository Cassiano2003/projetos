library ieee;
use ieee.std_logic_1164.all;

entity shiftrotater is
    port (
        din:    in std_logic_vector(3 downto 0);
        desloc: in std_logic_vector(1 downto 0);
        shift:  in std_logic;
        dout:   out std_logic_vector(3 downto 0)
    );  
end entity;

architecture structural of shiftrotater is
    signal aux,aux_1,aux_2 : std_logic_vector(3 downto 0);
    signal shift_1 : std_logic;
begin
    shift_1 <= (desloc(0) or desloc(1)) and shift;

-- instaciaçao do mux 2
--din
    instamux3: entity work.mux2(behavioral)
        port map (i0 => din(3),i1 => din(2),sel => desloc(0),s => aux_1(3));
    instamux2: entity work.mux2(behavioral)
        port map (i0 => din(2),i1 => din(1),sel => desloc(0),s => aux_1(2));
    instamux1: entity work.mux2(behavioral)
        port map (i0 => din(1),i1 => din(0),sel => desloc(0),s => aux_1(1));
    instamux0: entity work.mux2(behavioral)
        port map (i0 => din(0),i1 => din(3),sel => desloc(0),s => aux_1(0));

    
    aux(3) <= '0' when (desloc(1) and shift) = '1' else aux_1(3);
    aux(2) <= '0' when (desloc(1) and shift) = '1' else aux_1(2);
    aux(0) <= '0' when (desloc(0) and shift) = '1' else aux_1(0);
    

    muxshift3 : entity work.mux2(behavioral)
        port map (i0 => aux_1(3),i1 => aux(3),sel => shift_1,s => aux_2(3));
    muxshift2 : entity work.mux2(behavioral)
        port map (i0 => aux_1(2),i1 => aux(2),sel => shift_1,s => aux_2(2));
    muxshift0 : entity work.mux2(behavioral)
        port map (i0 => aux_1(0),i1 => aux(0),sel => shift_1,s => aux_2(0));
    
    
--dout
    instamux_3: entity work.mux2(behavioral)
        port map (i0 => aux_2(3),i1 => aux_1(1),sel => desloc(1),s => dout(3));
    instamux_2: entity work.mux2(behavioral)
        port map (i0 => aux_2(2),i1 => aux_2(0),sel => desloc(1),s => dout(2));
    instamux_1: entity work.mux2(behavioral)
        port map (i0 => aux_1(1),i1 => aux_2(3),sel => desloc(1),s => dout(1));
    instamux_0: entity work.mux2(behavioral)
        port map (i0 => aux_2(0),i1 => aux_2(2),sel => desloc(1),s => dout(0));
    
end architecture;