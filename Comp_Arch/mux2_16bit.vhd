----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:37:26 02/14/2017 
-- Design Name: 
-- Module Name:    mux2_16bit - Behavioral 
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

entity mux2_16bit is
    Port ( S: in  STD_LOGIC;
           In0, In1: in  STD_LOGIC_VECTOR (15 downto 0);
           Z: out  STD_LOGIC_VECTOR (15 downto 0));
end mux2_16bit;

architecture Behavioral of mux2_16bit is

begin
Z <=	In0 after 1 ns when S='0' else
		In1 after 1 ns when S='1';
end Behavioral;

