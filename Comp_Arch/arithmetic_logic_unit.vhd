----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:31:35 03/20/2017 
-- Design Name: 
-- Module Name:    arithmetic_logic_unit - Behavioral 
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
use ieee.numeric_std.all;

entity arithmetic_logic_unit is
    Port ( dataA, dataB : in  STD_LOGIC_VECTOR (15 downto 0);
           FS_code : in  STD_LOGIC_VECTOR (4 downto 0);
           V, C_out : out  STD_LOGIC;
           dataG : out  STD_LOGIC_VECTOR (15 downto 0));
end arithmetic_logic_unit;

architecture Behavioral of arithmetic_logic_unit is

begin
	
	dataG <= dataA 																			after 5 ns when FS_code="00000" else 
				std_logic_vector( unsigned(dataA) + 1) 								after 5 ns when FS_code="00001" else 
				std_logic_vector( unsigned(dataA) + unsigned(dataB))				after 5 ns when FS_code="00010" else
				std_logic_vector( unsigned(dataA) + unsigned(dataB) + 1)			after 5 ns when FS_code="00011" else
				std_logic_vector( unsigned(dataA) + unsigned(not dataB))			after 5 ns when FS_code="00100" else
				std_logic_vector( unsigned(dataA) + unsigned(not dataB) + 1)	after 5 ns when FS_code="00101" else
				std_logic_vector( unsigned(dataA) - 1)									after 5 ns when FS_code="00110" else
				dataA																				after 5 ns when FS_code="00111" else
				dataA and dataB	after 5 ns when FS_code="01000" else
				dataA or dataB		after 5 ns when FS_code="01010" else
				dataA xor dataB	after 5 ns when FS_code="01100" else
				not dataA			after 5 ns when FS_code="01110";
				
	V <= '0';
	C_out <= '0';
				
end Behavioral;

