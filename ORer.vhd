library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ORer is
    Port (  in1 : in  STD_LOGIC_VECTOR (3 downto 0);
            in2 : in  STD_LOGIC_VECTOR (3 downto 0);
            cout : out  STD_LOGIC_VECTOR (3 downto 0));
end ORer;

architecture Behavioral of ORer is

begin
    cout <= in1 OR in2;

end Behavioral;
