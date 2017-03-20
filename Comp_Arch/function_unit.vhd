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
           FS : in  STD_LOGIC_VECTOR (6 downto 2);
           V, C, N, S : out  STD_LOGIC;
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
	

end Behavioral;

