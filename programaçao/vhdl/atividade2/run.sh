#chmod +x *.sh
clear
ghdl -i *.vhd
ghdl -m teste
ghdl -r teste --wave=ondas.ghw
gtkwave ondas.ghw