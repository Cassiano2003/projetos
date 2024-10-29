entity mux_8 is 
    port(
      d0,d1,d2,d3,d4,d5,d6,d7,c1,c2,c3,c4,c5 : in bit;
      r                                      : out bit 
    );
end mux_8;

architecture dataflow of mux_8 is
    signal s0,s1 : bit;
    begin
        m1 : entity work.mux_4(dataflow)
            port map(d0,d1,d2,d3,c1,c2,s0);
        m2 : entity work.mux_4(dataflow)
            port map(d4,d5,d6,d7,c3,c4,s1);
        m3 : entity work.mux_2(dataflow)
            port map(s0,s1,c5,r);
    end;
        