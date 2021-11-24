library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity testbench is 
end testbench;

architecture testing of testbench is
    component LFSR
        port (
            Cycles : in std_logic_vector(3 downto 0);
            Clock : in std_logic;
            Enable : in std_logic;
            Result : out std_logic_vector(3 downto 0)
        );
    end component;

    signal Cycles : std_logic_vector(3 downto 0);
    signal Clock : std_logic;
    signal Enable : std_logic;
    signal Result : std_logic_vector(3 downto 0);

    begin
    clk: process 
        begin
            Clock <= '0';
            wait for 5 ns;
            Clock <= '1';
            wait for 5 ns;
    end process;

    main: process
        begin
            Enable <= '0';
            Cycles <= "1111";
            wait for 10 ns;
            Enable <= '1';
            Cycles <= "0010";
            wait for 20 ns;
            Cycles <= "0110";
            wait;
    end process;
    U1: LFSR PORT MAP (Cycles, Clock, Enable, Result);
end;