----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:39:42 04/06/2017 
-- Design Name: 
-- Module Name:    zero_fill - Behavioral 
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

entity zero_fill is
    Port ( input : in  STD_LOGIC_VECTOR (2 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end zero_fill;

architecture Behavioral of zero_fill is

begin
output(15 downto 3)	<= "0000000000000";
output(2 downto 0)	<= input;

end Behavioral;

