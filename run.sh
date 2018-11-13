FILES="adder.vhdl adder_tb.vhdl"

CMD="
rm work-*.cf -f
ghdl_mcode -a $FILES
ghdl_mcode -r $1
"
nodemon --exec "bash -c '$CMD'" *.vhdl
echo $CMD
