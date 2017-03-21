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

entity arithmetic_logic_unit is
    Port ( dataA, dataB : in  STD_LOGIC_VECTOR (15 downto 0);
           FS_code : in  STD_LOGIC_VECTOR (4 downto 0);
		   --H_sel :  in  STD_LOGIC_VECTOR (1 downto 0);
		   --C_in : in  STD_LOGIC;
           --V, C_out : out  STD_LOGIC;
           dataG : out  STD_LOGIC_VECTOR (15 downto 0));
end arithmetic_logic_unit;

architecture Behavioral of arithmetic_logic_unit is

begin
	arithmeticProcess: process(FS_code) is 
	begin
		if FS_code="00000" then
			dataG <= dataA; 
		elsif FS_code="00001" then
			dataG <= dataA + '1'; 
		elsif FS_code="00010" then
			dataG <= dataA + dataB;
		elsif FS_code="00011" then
			dataG <= dataA + dataB + '1'; 
		elsif FS_code="00100" then
			dataG <= dataA + (not dataB); 
		elsif FS_code="00101" then
			dataG <= dataA + (not dataB) + '1';
		elsif FS_code="00110" then
			dataG <= dataA - 1; 
		elsif FS_code="00111" then 
			dataG <= dataA; 
				
		elsif FS_code="01000" then
			dataG <= dataA and dataB; 
		elsif FS_code="01010" then
			dataG <= dataA or dataB; 
		elsif FS_code="01100" then
			dataG <= dataA xor dataB; 
		elsif FS_code="01110" then
			dataG <= not dataA;
		
		elsif FS_code="10000" then
			dataG <= dataB; 
		elsif FS_code="10100" then
			dataG <= dataB * 2; 
		elsif FS_code="11000" then
			dataG <= dataB / 2; 
		end if;
	end process arithmeticProcess;
end Behavioral;

