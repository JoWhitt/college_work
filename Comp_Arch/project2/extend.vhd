----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:00:38 04/07/2017 
-- Design Name: 
-- Module Name:    extend - Behavioral 
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
entity extend is
    Port ( SR,DR : in  STD_LOGIC_VECTOR (2 downto 0);
           extended : out  STD_LOGIC_VECTOR (15 downto 0));
end extend;

architecture Behavioral of extend is

begin
extended(2 downto 0) <= SR;
extended(5 downto 3) <= DR;
extended(15 downto 6) <= 	"0000000000" when DR(2)='0' else
									"1111111111";

end Behavioral;

