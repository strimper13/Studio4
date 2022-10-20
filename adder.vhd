library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder is
  Port ( carry_in : in STD_LOGIC;
         switches : in STD_LOGIC_VECTOR (7 downto 0);
         sout : out STD_LOGIC_VECTOR (4 downto 0));
end adder;

architecture Structural of adder is

--COMPONENT DECLARATION
component bit_full_adder is
    Port ( in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           s : out STD_LOGIC);
end component bit_full_adder;

--SIGNAL DECLARATION
    SIGNAL c0 : STD_LOGIC;
    SIGNAL c1 : STD_LOGIC;
    SIGNAL c2 : STD_LOGIC;
    -- SIGNAL c3 : STD_LOGIC;
    -- SIGNAL s0 : STD_LOGIC;
    -- SIGNAL s1 : STD_LOGIC;
    -- SIGNAL s2 : STD_LOGIC;
    -- SIGNAL s3 : STD_LOGIC;

begin
    --5 bit output (only submodule)
--PORT MAPPING
    bit_full_adder0: bit_full_adder port map
        (in1=>switches(0),
         in2=>switches(4),
         cin=>carry_in,
         cout=>c0,
         s=>sout(0));
    bit_full_adder1: bit_full_adder port map
        (in1=>switches(1),
         in2=>switches(5),
         cin=>c0,
         cout=>c1,
         s=>sout(1));
    bit_full_adder2: bit_full_adder port map
        (in1=>switches(2),
         in2=>switches(6),
         cin=>c1,
         cout=>c2,
         s=>sout(2));
    bit_full_adder3: bit_full_adder port map
        (in1=>switches(3),
         in2=>switches(7),
         cin=>c2,
         cout=>sout(4),
         s=>sout(3));
end Structural;