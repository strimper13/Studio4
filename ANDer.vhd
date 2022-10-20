library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ANDer is
    Port (  in1 : in  STD_LOGIC_VECTOR (3 downto 0);
            in2 : in  STD_LOGIC_VECTOR (3 downto 0);
            cout : out  STD_LOGIC_VECTOR (3 downto 0));
end ANDer;

architecture Behavioral of ANDer is

begin
    
    cout <= in1 AND in2;

end Behavioral;
