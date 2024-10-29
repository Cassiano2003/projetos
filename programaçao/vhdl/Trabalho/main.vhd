library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity main is
    generic (
        senha : natural range 0 to 255 := 10;
        tempo_para_desarme : natural range 0 to 255 := 30
    );
    port (
        clk   : in std_logic;
        reset : in std_logic;
        input : in std_logic_vector (7 downto 0);
        display_0 : out std_logic_vector (7 downto 0);
        display_1 : out std_logic_vector (7 downto 0);
        trava_0 : out std_logic
    );
end entity;

architecture rtl of main is
    signal clk_aux : std_logic;
    signal segundos : std_logic_vector (7 downto 0);
    signal dis_0, dis_1 : std_logic_vector (3 downto 0);
begin

    for_0: for i in 0 to 3 generate
        dis_0(i) <= segundos(i);
        dis_1(i) <= segundos(i+4);
    end generate;


    DIV_CLK: entity work.clk_div(behavioral)
    generic map (N => 50_000_000)
    port map (clk => clk,clk_divided => clk_aux);

    TRAVA: entity work.Trava(rtl)
    generic map (senha => senha,tempo_para_desarme => tempo_para_desarme)
    port map (input => input,reset => reset,segundos => segundos,trava_0 => trava_0,clk => clk_aux);

    
    BINTO_0: entity work.binto7seg(behavioral)
    port map (input => dis_0,display => display_0);
    
    BINTO_1: entity work.binto7seg(behavioral)
    port map (input => dis_1,display => display_1);

end architecture;