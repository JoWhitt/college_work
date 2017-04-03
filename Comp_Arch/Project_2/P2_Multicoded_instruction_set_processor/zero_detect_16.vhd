----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:26:42 03/14/2017 
-- Design Name: 
-- Module Name:    zero_detect_16 - Behavioral 
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

entity zero_detect_16 is
    Port ( data : in  STD_LOGIC_VECTOR (15 downto 0);
           z : out  STD_LOGIC);
end zero_detect_16;

architecture Behavioral of zero_detect_16 is

begin
z <=	'1' after 1 ns when data="0000000000000000" 
		else '0';
end Behavioral;

