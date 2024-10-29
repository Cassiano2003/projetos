#chmod +x *.sh
clear
ghdl -i *.vhd
ghdl -m teste_trava
ghdl -r teste_trava --wave=ondas.ghw
#gtkwave ondas.ghw
