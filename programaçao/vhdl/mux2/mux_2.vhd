entity mux_2 is
    port(
        d0, d1, c:in bit;
        r        :out bit
    );
end mux_2;

architecture dataflow of mux_2 is
    begin
        r <= d0 when c = '1' else d1;
end dataflow;