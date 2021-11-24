library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity testbench is
end testbench;

architecture testing of testbench is
    component Adder
        port(
            A : in std_logic_vector(2 downto 0);
            B : in std_logic_vector(2 downto 0);
            Result : out std_logic_vector(3 downto 0);
            C : out std_logic_vector(2 downto 0)
        );
    end component;

    signal A : std_logic_vector(2 downto 0);
    signal B : std_logic_vector(2 downto 0);
    signal Result : std_logic_vector(3 downto 0);
    signal C : std_logic_vector(2 downto 0);
    
    begin
    process
        begin
            A <= "000"; B <= "000";
            LoopA : for i in 0 to 6 loop
                wait for 10 ns;
                A <= A + '1';
                LoopB : for j in 0 to 6 loop
                    wait for 10 ns;
                    B <= B + '1';
                    wait for 10 ns;
                end loop ; -- LoopB
                wait for 10 ns;
            end loop ; -- LoopA
            wait for 20 ns;
        end process;
        U1: Adder PORT MAP (A, B, Result, C);
    end;