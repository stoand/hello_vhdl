entity main is
    port (i0, i1 : in bit; ci : in bit; s : out bit; co : out bit);
end main;

architecture rtl of main is
begin
    -- This full-adder architecture contains two concurrent assignments
    -- Compute the sum.
    s <= i0 xor i1 xor ci;
    co <= (i0 and i1) or (i0 and ci) or (i1 and ci);
end rtl;
