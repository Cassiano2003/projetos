#chmod +x *.sh
clear
ghdl -i *.vhd
ghdl -m mux_8_tb
ghdl -r mux_8_tb --wave=ondas.ghw
gtkwave ondas.ghw