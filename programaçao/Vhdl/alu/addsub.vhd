library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addsub is
    generic (
        N: natural := 8
    );
    port (
        A, B: in std_logic_vector(N-1 downto 0);
        operation: in std_logic;
        S: out std_logic_vector(N-1 downto 0)
    );
end entity;

architecture behavioral of addsub is

    signal soma_sinal, sub_sinal : std_logic_vector(N-1 downto 0);
    
    signal tamanho_u : std_logic_vector(0 to N-1) := (others => '1');
    signal tamanho_s : std_logic_vector(0 to N-1) := (0 => '1', others => '0');
    signal t_u : integer := to_integer(unsigned(tamanho_u)) *2;
    signal t_s : integer := to_integer(signed(tamanho_s))   *2;
    signal t_s2: integer := to_integer(unsigned(tamanho_s)) *2;

    signal AI, BI, soma: integer range 0 to t_u - 1;
    signal AI_s, BI_s, sub: integer range t_s to t_s2-1;
   
begin

    --assert N = 1 report "t_u = " & integer'image(t_u-1) & ", t_s = " & integer'image(t_s) & ", t_s2 = " & integer'image(t_s2-1);

    AI <= to_integer(unsigned(A));
    BI <= to_integer(unsigned(B));

    AI_s <= to_integer(signed(A));
    BI_s <= to_integer(signed(B));

    --assert N = 1 report "AI = " & integer'image(AI) & ", BI = " & integer'image(BI) & ", AI_s = " & integer'image(AI_s) & ", BI_s = " & integer'image(BI_s);

    soma <= AI + BI;
    sub <= AI_s - BI_s;

    --assert N = 1 report "Soma = " & integer'image(soma) & ", Sub = " & integer'image(sub);

    soma_sinal <= std_logic_vector(to_unsigned(soma,soma_sinal'length));
    sub_sinal <= std_logic_vector(to_signed(sub,sub_sinal'length));

    S <= soma_sinal when operation = '0' else sub_sinal;

end architecture;