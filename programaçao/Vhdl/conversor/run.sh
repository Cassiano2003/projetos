#chmod +x *.sh
clear
ghdl -i *.vhd
ghdl -m teste_s
ghdl -r teste_s --wave=ondas.ghw
#gtkwave ondas.ghw