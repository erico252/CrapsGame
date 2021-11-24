--This is an LFSR that has an XOR gate between the 2nd and 3rd bit
--that will create 5 numbers, these numbers then need to be mapped
--to the poroper number that they are to represent as a dice roll
--
--The LFSR creates the numbers 5,2,1,8,4,12
--these will be re mapped too  1,2,3,4,5,6
--
--The seed will remain as a constant, the part htat hcanges
--is the amount of cycles througth the LFSR

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity LFSR is
    port(
        Cycles : in std_logic_vector(3 downto 0);
        Clock : in std_logic;
        Enable : in std_logic;
        Result : out std_logic_vector(3 downto 0)
    );
end LFSR;

architecture shifting of LFSR is
    signal Current_InternalBits : std_logic_vector(3 downto 0) := "0101"; --Initialize the interal bits of the LFSR to be the submitted seed
    signal Next_InternalBits : std_logic_vector(3 downto 0) := "0000";
    signal CyclesCondition : std_logic_vector(3 downto 0) := "0000";
    begin
    process(Clock)
        begin
            if(Enable = '1' AND CyclesCondition <= Cycles) then
                Next_InternalBits(3) <= Current_InternalBits(2) XOR Current_InternalBits(0);
                Next_InternalBits(2) <= Current_InternalBits(3);
                Next_InternalBits(1) <= Current_InternalBits(2);
                Next_InternalBits(0) <= Current_InternalBits(1);
                Current_InternalBits <= Next_InternalBits;
                Result <= Current_InternalBits;
                CyclesCondition <= CyclesCondition + '1';
            else
                Result <= "0000";
                CyclesCondition <= "0000";
                Current_InternalBits <= "0101";
            end if;
            
    end process;
end shifting;
