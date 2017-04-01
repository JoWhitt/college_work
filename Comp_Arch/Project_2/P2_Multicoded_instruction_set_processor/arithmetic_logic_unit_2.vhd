----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:59:58 03/25/2017 
-- Design Name: 
-- Module Name:    arithmetic_logic_unit_2 - Behavioral 
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
entity arithmetic_logic_unit_2 is
    Port ( dataA, dataB : in  STD_LOGIC_VECTOR (15 downto 0);
           FS_code : in  STD_LOGIC_VECTOR (4 downto 0);
           V, C_out : out  STD_LOGIC;
           dataG : out  STD_LOGIC_VECTOR (15 downto 0));
end arithmetic_logic_unit_2;

architecture Behavioral of arithmetic_logic_unit_2 is
--COMPONENTS
	component ripple_adder_16bit is
   Port ( Ain, Bin : in  STD_LOGIC_VECTOR (15 downto 0);
           C_in : in  STD_LOGIC;
			  Z : out  STD_LOGIC_VECTOR (15 downto 0);
           C_out, V_out : out  STD_LOGIC );
	end component;

--SIGNALS
signal rippleDataB: STD_LOGIC_VECTOR (15 downto 0);
signal c_signal: STD_LOGIC;

begin
	--PORT MAPS
	ripple_adder: ripple_adder_16bit port map (
		Ain => dataA,
		Bin => rippleDataB,
		C_in => c_signal,
		Z => dataG,
		C_out => C_out,
		V_out => V
	);

	c_signal <= FS_code(0);
	rippleDataB <= (dataB) when FS_code(2 downto 1)="01" else
						(not dataB) when FS_code(2 downto 1)="10" else 
						"1111111111111110" when FS_code(2 downto 1)="11" else 
						"0000000000000000";
end Behavioral;

