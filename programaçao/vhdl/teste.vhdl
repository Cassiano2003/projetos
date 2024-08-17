entity teste is

--Sinaisdeentradaesaida
port(
    i0,i1:in bit; --Dadosaseremsomados
    ci:in bit; --Carryin
    s,co:out bit --ResultadodasomaeCarryout
);
end teste;

architecture behavioral of teste is
begin

s <= i0 xor i1 xor ci;
co <= (i0 and i1) or (i0 and ci) or (i1 and ci);

end behavioral;
