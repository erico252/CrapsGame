library ieee;
use ieee.std_logic_1164.all;

entity Adder is
    port (
        A : in std_logic_vector(2 downto 0);
        B : in std_logic_vector(2 downto 0);
        Result : out std_logic_vector(3 downto 0);
        C : out std_logic_vector(2 downto 0) --For testing to see if the carried numbers are accurate
    );
end Adder;

architecture adding of Adder is
    --signal 
    signal Carry : std_logic_vector(3 downto 0) := "0000";
begin

    Result(0) <= A(0) xor B(0);
    Carry(0) <= A(0) and B(0);
    C(0) <= Carry(0);

    Result(1) <= A(1) xor B(1) xor Carry(0);
    Carry(1) <= ((A(1) xor B(1)) and Carry(0)) or (A(0) and B(0));
    C(1) <= Carry(1);

    Result(2) <= A(2) xor B(2) xor Carry(1);
    Carry(2) <= ((A(2) xor B(2)) and Carry(1)) or (A(1) and B(1));
    C(2) <= Carry(2);

    Result(3) <= Carry(2);

end adding;