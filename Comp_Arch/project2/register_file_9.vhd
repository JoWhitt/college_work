----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:12:29 04/01/2017 
-- Design Name: 
-- Module Name:    register_file_9 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_file_9 is
    PORT(  load_enable, CLK : in  STD_LOGIC;
           DA,AA,BA: in STD_LOGIC_VECTOR(3 downto 0);
           DData : in  STD_LOGIC_VECTOR (15 downto 0);
           A,B : out  STD_LOGIC_VECTOR (15 downto 0));
end register_file_9;

architecture Behavioral of register_file_9 is
--COMPONENTS
	component decoder_4to9 is
    Port ( In0,In1,In2,In3: in  STD_LOGIC;
           Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8: out  STD_LOGIC);
	end component;
	
	component reg
   Port (  D: in STD_LOGIC_VECTOR (15 downto 0);
           load, CLK: in STD_LOGIC;
           Q: out STD_LOGIC_VECTOR (15 downto 0) );
	end component;
	
	component mux9_16bit is
    Port ( s0,s1,s2,s3 : in  STD_LOGIC;
           in0,in1,in2,in3,in4,in5,in6,in7,in8 : in  STD_LOGIC_VECTOR (15 downto 0);
           z : out STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
--SIGNALS
signal decodeQ0,decodeQ1,decodeQ2,decodeQ3,decodeQ4,decodeQ5,decodeQ6,decodeQ7,decodeQ8,
		 loadReg0,loadReg1,loadReg2,loadReg3,loadReg4,loadReg5,loadReg6,loadReg7,loadReg8 : STD_LOGIC;
signal reg0Q,reg1Q,reg2Q,reg3Q,reg4Q,reg5Q,reg6Q,reg7Q,reg8Q : STD_LOGIC_VECTOR (15 downto 0);

begin
--PORT MAPS
	decoder: decoder_4to9 port map (
		In0 => DA(0),
		In1 => DA(1),
		In2 => DA(2),
		In3 => DA(3),
		Q0 => decodeQ0,
		Q1 => decodeQ1,
		Q2 => decodeQ2,
		Q3 => decodeQ3,
		Q4 => decodeQ4,
		Q5 => decodeQ5,
		Q6 => decodeQ6,
		Q7 => decodeQ7,
		Q8 => decodeQ8
	);
	
	loadReg0 <= decodeQ0 and load_enable;
	loadReg1 <= decodeQ1 and load_enable;
	loadReg2 <= decodeQ2 and load_enable;
	loadReg3 <= decodeQ3 and load_enable;
	loadReg4 <= decodeQ4 and load_enable;
	loadReg5 <= decodeQ5 and load_enable;
	loadReg6 <= decodeQ6 and load_enable;
	loadReg7 <= decodeQ7 and load_enable;
	loadReg8 <= decodeQ8 and load_enable;
	
	reg00: reg port map (
		D => DData,
		load => loadReg0,
		CLK => CLK,
		Q => reg0Q
	);
	
	reg01: reg  port map (
		D => DData,
		load => loadReg1,
		CLK => CLK,
		Q => reg1Q
	);
	
	reg02: reg  port map (
		D => DData,
		load => loadReg2,
		CLK => CLK,
		Q => reg2Q
	);
	
	reg03: reg  port map (
		D => DData,
		load => loadReg3,
		CLK => CLK,
		Q => reg3Q
	);
	
	reg04: reg  port map (
		D => DData,
		load => loadReg4,
		CLK => CLK,
		Q => reg4Q
	);
	
	reg05: reg  port map (
		D => DData,
		load => loadReg5,
		CLK => CLK,
		Q => reg5Q
	);
	
	reg06: reg  port map (
		D => DData,
		load => loadReg6,
		CLK => CLK,
		Q => reg6Q
	);
	
	reg07: reg  port map (
		D => DData,
		load => loadReg7,
		CLK => CLK,
		Q => reg7Q
	);
	
	reg08: reg  port map (
		D => DData,
		load => loadReg8,
		CLK => CLK,
		Q => reg8Q
	);
	
	muxA: mux9_16bit port map (
		 s0 => AA(0),
		 s1 => AA(1),
		 s2 => AA(2),
		 s3 => AA(3),
		 in0 => reg0Q,
		 in1 => reg1Q,
		 in2 => reg2Q,
		 in3 => reg3Q,
		 in4 => reg4Q,
		 in5 => reg5Q,
		 in6 => reg6Q,
		 in7 => reg7Q,
		 in8 => reg8Q,
		 z => A
	);
	
	muxB: mux9_16bit PORT MAP (
		 s0 => BA(0),
		 s1 => BA(1),
		 s2 => BA(2),
		 s3 => BA(3),
		 in0 => reg0Q,
		 in1 => reg1Q,
		 in2 => reg2Q,
		 in3 => reg3Q,
		 in4 => reg4Q,
		 in5 => reg5Q,
		 in6 => reg6Q,
		 in7 => reg7Q,
		 in8 => reg8Q,
		 z => B
    );
	 

end Behavioral;

