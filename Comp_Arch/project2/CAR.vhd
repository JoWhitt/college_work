----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:36:37 04/07/2017 
-- Design Name: 
-- Module Name:    CAR - Behavioral 
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

entity CAR is
    Port ( muxCOut : in  STD_LOGIC_VECTOR (7 downto 0);
           muxSOut : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end CAR;

architecture Behavioral of CAR is

begin
output <= 	(muxCOut) when muxSOut='0' else
				"00000000";

end Behavioral;


