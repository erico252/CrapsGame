library ieee;
use ieee.std_logic_1164.all;

entity JKFlipFlop is
    port(
        J : in std_logic;
        K : in std_logic;
        clk : in std_logic;
        Q :out std_logic
    );
end JKFlipFlop;

architecture fliptiyflop of JKFlipFlop is
    signal S : std_logic;
    signal Sbar: std_logic;
    signal R :std_logic;
    signal Rbar : std_logic;
    signal Qbar: std_logic;
    signal Jbar : std_logic;
    signal Kbar : std_logic;

begin
    S <= J and Qbar and clk;
    Sbar <= not S;
    R <= K and Q and clk;
    Rbar <= not R;

    Q <= Sbar nand Qbar;
    Qbar <= Rbar nand Q;
end fliptiyflop;
