----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:19:22 03/20/2017 
-- Design Name: 
-- Module Name:    function_unit - Behavioral 
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

entity function_unit is
    Port ( busA, busB : in  STD_LOGIC_VECTOR (15 downto 0);
           FSel : in  STD_LOGIC_VECTOR (4 downto 0);
           V, C, N, Z : out  STD_LOGIC;
           F : out  STD_LOGIC_VECTOR (15 downto 0));
end function_unit;

architecture Behavioral of function_unit is
-- COMPONENTS
	component shifter_16bit is
		Port(	input: in STD_LOGIC(15 to 0);
				sel0,sel1,sel2,sel3 : in  STD_LOGIC;
				y: out STD_LOGIC(15 to 0));
	end component;
	
	component zero_detect_16 is
		 Port ( data : in  STD_LOGIC_VECTOR (15 downto 0);
				  z : out  STD_LOGIC);
	end component;
	
	component mux2_16bit is
		 Port ( S: in  STD_LOGIC;
				  In0, In1: in  STD_LOGIC_VECTOR (15 downto 0);
				  Z: out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	component arithmetic_logic_unit is
		 Port ( busA, busB : in  STD_LOGIC_VECTOR (15 downto 0);
				  G_sel : in  STD_LOGIC_VECTOR (4 downto 0);
				  V, C : out  STD_LOGIC;
				  G : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
--	SIGNALS
	signal ALU_out, shifter_out: STD_LOGIC_VECTOR (15 downto 0);

begin
--PORT DECLARATIONS
	ALU: arithmetic_logic_unit port map (
		dataA => busA, 
		dataB => busB,
		FS_code => FSel,
		V => V,
		C_out => C,
		dataG => ALU_out
	);
			  
	shifter: shifter_16bit port map (
		input => busB,
		sel0 => FSel(0), --TODO: confirm
		sel1 => FSel(1),
		sel2 => FSel(2),
		sel3 => FSel(3),
		y => shifter_out
	);
	
	z_flag: zero_detect_16 port map (
		data => ALU_out,
		z => Z
	);
	
	muxF: mux2_16bit port map (
		S => FSel(4),	--TODO: confirm
		In0 => ALU_out,
		In1 => shifter_out,
		Z => F
	);

end Behavioral;

