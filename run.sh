CMD="ghdl_mcode -a *.vhdl && ghdl_mcode -r $1"
nodemon --exec "bash -c '$CMD'" *.vhdl
echo $CMD
