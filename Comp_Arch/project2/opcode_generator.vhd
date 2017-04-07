----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:42:35 04/07/2017 
-- Design Name: 
-- Module Name:    opcode_generator - Behavioral 
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

entity opcode_generator is
    Port ( IL : in  STD_LOGIC;
           IR : in  STD_LOGIC_VECTOR (15 downto 0);
           opcode : out  STD_LOGIC_VECTOR (7 downto 0);
           DR, SA, SB : out  STD_LOGIC_VECTOR (2 downto 0));
end opcode_generator;

architecture Behavioral of opcode_generator is
begin

opcode(7) <= IL;
opcode(6 downto 0) <= IR(15 downto 9);
DR	<= IR(8 downto 6);
SA <= IR(5 downto 3);
SB <= IR(2 downto 0);

end Behavioral;

