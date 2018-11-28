entity adder_tb is
end adder_tb;

architecture behav of adder_tb is

    component adder
        port ( i0, i1, ci : in bit; s, co : out bit );
    end component;

    -- entity bound to component
    for adder_0: adder use entity work.adder;
    signal i0, i1, ci, s, co : bit;
begin
    -- component instantiation
    adder_0: adder port map (i0 => i0, i1 => i1, ci => ci,
        s => s, co => co);

    process
        type pattern_type is record
            -- adder inputs
            i0, i1, ci : bit;
            -- expected outputs
            s, co : bit;
        end record;

        -- patterns 
        type pattern_array is array (natural range <>) of pattern_type;
        constant patterns : pattern_array :=
           (('0', '0', '0', '0', '0'),
            ('0', '0', '1', '1', '0'),
            ('0', '1', '0', '1', '0'),
            ('0', '1', '1', '0', '1'),
            ('1', '0', '0', '1', '0'),
            ('1', '0', '1', '0', '1'),
            ('1', '1', '0', '0', '1'),
            ('1', '1', '1', '1', '1'));
    begin
        for i in patterns'range loop
            i0 <= patterns(i).i0;
            i1 <= patterns(i).i1;
            ci <= patterns(i).ci;
            -- wait for results
            wait for 1 ns;
            -- check the outputs
            assert s = patterns(i).s
                report "bad sum" severity error;
            assert co = patterns(i).co
                report "bad carry" severity error;
        end loop;
        wait;
        assert false report "end of test" severity note;
    end process;
end behav;
