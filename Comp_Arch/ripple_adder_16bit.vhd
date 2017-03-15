----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:38:43 03/14/2017 
-- Design Name: 
-- Module Name:    ripple_adder_16bit - Behavioral 
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

entity ripple_adder_16bit is
    Port ( input : in  STD_LOGIC_VECTOR (15 downto 0);
           c_in : in  STD_LOGIC;
           c_out : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end ripple_adder_16bit;

architecture Behavioral of ripple_adder_16bit is
-- COMPONENTS
	component full_adder is
		Port (  A: in  STD_LOGIC;
				  B: in  STD_LOGIC;
				  c_in: in  STD_LOGIC;
				  c_out: out  STD_LOGIC;
				  S: out  STD_LOGIC);
	end component;

begin
-- PORT MAPS

end Behavioral;

