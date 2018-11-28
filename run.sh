FILES="adder.vhdl adder_tb.vhdl"

CMD="
rm work-*.cf -f
ghdl -a $FILES
ghdl -r $1
"
nodemon --exec "bash -c '$CMD'" *.vhdl
echo $CMD
