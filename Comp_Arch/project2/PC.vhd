----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:57:00 04/07/2017 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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
entity PC is
    Port ( DR_SB_extended : in  STD_LOGIC_VECTOR (15 downto 0);
           PL,PI : in  STD_LOGIC;
			  PC : out  STD_LOGIC_VECTOR (15 downto 0));
end PC;

architecture Behavioral of PC is

begin
	PC <= DR_SB_extended;

end Behavioral;

