all:
	nodemon --exec "bash -c 'ghdl_mcode -a main.vhdl && ghdl_mcode -r main'" *.vhdl
