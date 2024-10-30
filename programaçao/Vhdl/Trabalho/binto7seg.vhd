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
	 --                           76543210
      when "0000" => display <= "11000000"; -- 0
      when "0001" => display <= "11111001"; -- 1
      when "0010" => display <= "10100100"; -- 2
      when "0011" => display <= "10110000"; -- 3
      when "0100" => display <= "10011001"; -- 4
      when "0101" => display <= "10010010"; -- 5
      when "0110" => display <= "10000010"; -- 6
      when "0111" => display <= "11111000"; -- 7
      when "1000" => display <= "10000000"; -- 8
      when "1001" => display <= "10011000"; -- 9
      when "1010" => display <= "10001000"; -- letra A(10 em hex) 
      when "1011" => display <= "10000011"; -- letra b(11 em hex)
      when "1100" => display <= "11000110"; -- letra C(12 em hex)
      when "1101" => display <= "10100001"; -- letra d(13 em hex)
      when "1110" => display <= "10000110"; -- letra E(14 em hex)
      when "1111" => display <= "10001110"; -- letra F(15 em hex)
    end case;
  end process;
end architecture behavioral;
