entity mux_4 is 
    port(
        d0, d1, d2,  d3, c1,c2: in bit;
        r                 : out bit
    );
end mux_4;


architecture dataflow of mux_4 is
    signal s0, s1: bit;
    begin
        m0 : entity work.mux_2(dataflow)
            port map(d0,d1,c1,s0);
        m1 : entity work.mux_2(dataflow)
            port map(d2,d3,c1,s1);

        m3 : entity work.mux_2(dataflow)
            port map(s0,s1,c2,r);
    end;