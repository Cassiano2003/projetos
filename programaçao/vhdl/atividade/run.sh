#chmod +x *.sh
clear
ghdl -i *.vhd
ghdl -m testfulladder1
ghdl -r testfulladder1 --wave=ondas.ghw
gtkwave ondas.ghw