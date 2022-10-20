library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity toplevel is
    Port ( clk, carry_in: in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           funcControl : in STD_LOGIC_VECTOR (1 downto 0));
end toplevel;

architecture Structural of toplevel is


--COMPONENT DECLARATION
component ANDer is
    Port (  in1 : in  STD_LOGIC_VECTOR (3 downto 0);
            in2 : in  STD_LOGIC_VECTOR (3 downto 0);
            cout : out  STD_LOGIC_VECTOR (3 downto 0));
end component ANDer;

component ORer is
    Port (  in1 : in  STD_LOGIC_VECTOR (3 downto 0);
            in2 : in  STD_LOGIC_VECTOR (3 downto 0);
            cout : out  STD_LOGIC_VECTOR (3 downto 0));
end component ORer;

component XORer is
    Port (  in1 : in  STD_LOGIC_VECTOR (3 downto 0);
            in2 : in  STD_LOGIC_VECTOR (3 downto 0);
            cout : out  STD_LOGIC_VECTOR (3 downto 0));
end component XORer;

component adder is
    Port (  carry_in : in STD_LOGIC;
            switches : in STD_LOGIC_VECTOR (7 downto 0);
            sout : out STD_LOGIC_VECTOR (4 downto 0));
end component adder;

component function_select is
    Port ( Input0 : in  STD_LOGIC_VECTOR (3 downto 0);
           Input1 : in  STD_LOGIC_VECTOR (3 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (3 downto 0);
           Input3 : in  STD_LOGIC_VECTOR (4 downto 0);
           control : in  STD_LOGIC_VECTOR (1 downto 0);
           Output : out  STD_LOGIC_VECTOR (4 downto 0));
end component function_select;
    
component display_driver is
    Port ( inputs : in  STD_LOGIC_VECTOR (3 downto 0);
           seg_out : out  STD_LOGIC_VECTOR (6 downto 0));
end component display_driver;
    
component LEDdisplay is
	Port ( clk : IN  STD_LOGIC;
		   seg0,seg1,seg2,seg3 : IN  STD_LOGIC_VECTOR(6 downto 0);
           seg : OUT  STD_LOGIC_VECTOR(6  downto 0);
		   an : OUT STD_LOGIC_VECTOR(3 downto 0));		  
end component LEDdisplay;


--SIGNAL DECLARATION
    SIGNAL c0 : STD_LOGIC;
    SIGNAL c1 : STD_LOGIC;
    SIGNAL c2 : STD_LOGIC;
    SIGNAL c3 : STD_LOGIC;
    SIGNAL s0 : STD_LOGIC;
    SIGNAL s1 : STD_LOGIC;
    SIGNAL s2 : STD_LOGIC;
    SIGNAL s3 : STD_LOGIC;
    SIGNAL sig_segments1 : STD_LOGIC_VECTOR (6 downto 0);
    SIGNAL sig_segments2 : STD_LOGIC_VECTOR (6 downto 0);
    SIGNAL funcOutput : STD_LOGIC_VECTOR (4 downto 0);
    SIGNAL ANDout :  STD_LOGIC_VECTOR (3 downto 0);
    SIGNAL ORout :  STD_LOGIC_VECTOR (3 downto 0);
    SIGNAL XORout :  STD_LOGIC_VECTOR (3 downto 0);
    SIGNAL ADDERout : STD_LOGIC_VECTOR (4 downto 0);
    
begin
--PORT MAPPING
    ANDer1: ANDer port map
        (in1(0)=>sw(0),
         in1(1)=>sw(1),
         in1(2)=>sw(2),
         in1(3)=>sw(3),
         in2(0)=>sw(4),
         in2(1)=>sw(5),
         in2(2)=>sw(6),
         in2(3)=>sw(7),
         cout=>ANDout);
    ORer1: ORer port map
        (in1(0)=>sw(0),
         in1(1)=>sw(1),
         in1(2)=>sw(2),
         in1(3)=>sw(3),
         in2(0)=>sw(4),
         in2(1)=>sw(5),
         in2(2)=>sw(6),
         in2(3)=>sw(7),
         cout=>ORout);
    XORer1: XORer port map
        (in1(0)=>sw(0),
         in1(1)=>sw(1),
         in1(2)=>sw(2),
         in1(3)=>sw(3),
         in2(0)=>sw(4),
         in2(1)=>sw(5),
         in2(2)=>sw(6),
         in2(3)=>sw(7),
         cout=>XORout);
    ADDER1: adder port map
        (carry_in=>carry_in,
         switches=>sw,
         sout=>ADDERout);
    function_select1: function_select port map
        (  Input0=>ANDout, --ANDer
           Input1=>ORout, --ORer
           Input2=>XORout, --XORer
           Input3=>ADDERout, --ADDER1
           control=>funcControl,
           Output=>funcOutput);
    display_driver1: display_driver port map
        (inputs(0)=>funcOutput(0),
         inputs(1)=>funcOutput(1),
         inputs(2)=>funcOutput(2),
         inputs(3)=>funcOutput(3),
         seg_out=>sig_segments1);
    display_driver2: display_driver port map
        (inputs(0)=>funcOutput(4),
         inputs(1)=>'0',
         inputs(2)=>'0',
         inputs(3)=>'0',
         seg_out=>sig_segments2);
    LEDdisplay0: LEDdisplay port map
        (seg0=>sig_segments1,
         seg1=>sig_segments2,
         seg2=>"1111111",
         seg3=>"1111111",
         clk=>clk,
         an=>an,
         seg=>seg);
    
end Structural;