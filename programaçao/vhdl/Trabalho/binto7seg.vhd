library ieee;
use ieee.std_logic_1164.all;

entity binto7seg is
  port (
    input : in std_logic_vector(3 downto 0); -- valor binario a ser mostrado
    display : out std_logic_vector(7 downto 0) -- leds do display de 7 segmentos
  );
end entity binto7seg;

architecture behavioral of binto7seg is
begin
  process(input)
  begin
    case input is -- caso baseado no input em hexadecimal para o display
      when "0000" => display <= "00000000"; -- 0
      when "0001" => display <= "00000001"; -- 1
      when "0010" => display <= "00000010"; -- 2
      when "0011" => display <= "00000011"; -- 3
      when "0100" => display <= "00000100"; -- 4
      when "0101" => display <= "00000101"; -- 5
      when "0110" => display <= "00000110"; -- 6
      when "0111" => display <= "00000111"; -- 7
      when "1000" => display <= "00001000"; -- 8
      when "1001" => display <= "00001001"; -- 9
      when "1010" => display <= "00001010"; -- letra A(10 em hex) 
      when "1011" => display <= "00001011"; -- letra b(11 em hex)
      when "1100" => display <= "00001100"; -- letra C(12 em hex)
      when "1101" => display <= "00001101"; -- letra d(13 em hex)
      when "1110" => display <= "00001110"; -- letra E(14 em hex)
      when "1111" => display <= "00001111"; -- letra F(15 em hex)
      when others => display <= "11111111"; -- default
    end case;
  end process;
end architecture behavioral;