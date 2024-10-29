#chmod +x *.sh
clear
ghdl -i *.vhd
ghdl -m  tb_somador1
ghdl -r tb_somador1 --wave=ondas.ghw
gtkwave ondas.ghw