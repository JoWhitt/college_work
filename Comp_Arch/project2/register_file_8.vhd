----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:37:09 04/04/2017 
-- Design Name: 
-- Module Name:    register_file_8 - Behavioral 
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
entity register_file_8 is
    Port ( destAddress,srcAddress : in  STD_LOGIC_VECTOR (2 downto 0);
           DataIn : in  STD_LOGIC_VECTOR (15 downto 0);
           load_enable, CLK : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (15 downto 0));
end register_file_8;

architecture Behavioral of register_file_8 is
--COMPONENTS
	component decoder_3to8 is
   Port (  A0,A1,A2: in  STD_LOGIC;
           Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7: out  STD_LOGIC );
	end component;
	
	component reg
   Port (  D: in STD_LOGIC_VECTOR (15 downto 0);
           load, CLK: in STD_LOGIC;
           Q: out STD_LOGIC_VECTOR (15 downto 0) );
	end component;
	
	component mux8_16bit is
   Port (  S0,S1,S2: in STD_LOGIC;
           In0,In1,In2,In3,In4,In5,In6,In7: in STD_LOGIC_VECTOR (15 downto 0);
           Z: out STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
--SIGNALS
signal decodeQ0,decodeQ1,decodeQ2,decodeQ3,decodeQ4,decodeQ5,decodeQ6,decodeQ7,
		 loadReg0,loadReg1,loadReg2,loadReg3,loadReg4,loadReg5,loadReg6,loadReg7 : STD_LOGIC;
signal reg0Q,reg1Q,reg2Q,reg3Q,reg4Q,reg5Q,reg6Q,reg7Q : STD_LOGIC_VECTOR (15 downto 0);

begin
--PORT MAPS
	decoder: decoder_3to8 PORT MAP(
		A0 => destAddress(0),
		A1 => destAddress(1),
		A2 => destAddress(2),
      Q0 => decodeQ0,
		Q1 => decodeQ1,
		Q2 => decodeQ2,
		Q3 => decodeQ3,
		Q4 => decodeQ4,
		Q5 => decodeQ5,
		Q6 => decodeQ6,
		Q7 => decodeQ7
	);

loadReg0 <= load_enable and decodeQ0;
loadReg1 <= load_enable and decodeQ1;
loadReg2 <= load_enable and decodeQ2;
loadReg3 <= load_enable and decodeQ3;
loadReg4 <= load_enable and decodeQ4;
loadReg5 <= load_enable and decodeQ5;
loadReg6 <= load_enable and decodeQ6;
loadReg7 <= load_enable and decodeQ7;

	--Registers (8)
	reg00: reg PORT MAP(
		D => DataIn,
		load => loadReg0,
		Clk => CLK,
		Q => reg0Q
	);
	
	reg01: reg PORT MAP(
		D => DataIn,
		load => loadReg1,
		Clk => CLK,
		Q => reg1Q
	);
	
	reg02: reg PORT MAP(
		D => DataIn,
		load => loadReg2,
		Clk => CLK,
		Q => reg2Q
	);
	
	reg03: reg PORT MAP(
		D => DataIn,
		load => loadReg3,
		Clk => CLK,
		Q => reg3Q
	);
	
	reg04: reg PORT MAP(
		D => DataIn,
		load => loadReg4,
		Clk => CLK,
		Q => reg4Q
	);
	
	reg05: reg PORT MAP(
		D => DataIn,
		load => loadReg5,
		Clk => CLK,
		Q => reg5Q
	);
	
	reg06: reg PORT MAP(
		D => DataIn,
		load => loadReg6,
		Clk => CLK,
		Q => reg6Q
	);
	
	reg07: reg PORT MAP(
		D => DataIn,
		load => loadReg7,
		Clk => CLK,
		Q => reg7Q
	);
	
	mux: mux8_16bit PORT MAP(
		S0 => srcAddress(0),
		S1 => srcAddress(1),
		S2 => srcAddress(2),
      In0 => reg0Q,
		In1 => reg1Q,
		In2 => reg2Q,
		In3 => reg3Q,
		In4 => reg4Q,
		In5 => reg5Q,
		In6 => reg6Q,
		In7 => reg7Q,
      Z => DataOut
	);
	
end Behavioral;

