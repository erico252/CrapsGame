library ieee;
use ieee.std_logic_1164.all;


entity testbench is
end testbench;

architecture testing of testbench is
    component Adder
        port (
            A : in std_logic;
            B : in std_logic;
            Result : out std_logic;
            Carry : out std_logic
        );
    end component;

    signal A : std_logic;
    signal B : std_logic;
    signal Result : std_logic;
    signal Carry : std_logic;
    
    begin
        process
        begin
            
            A <= '0'; B <= '0';
            wait for 10 ns;
            ALoop : for i in 0 to 1 loop
                A <= A xor '1';
                BLoop : for j in 0 to 1 loop
                    B <= B xor '1';
                    wait for 10 ns;
                end loop; -- BLoop
            end loop; -- ALoop
            wait;
        end process;
        U1: Adder PORT MAP (A, B, Result, Carry);
    end;