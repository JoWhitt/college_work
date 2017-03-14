----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:34:55 02/14/2017 
-- Design Name: 
-- Module Name:    mux4_4bit - Behavioral 
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

entity mux8_16bit is
    Port ( S0,S1,S2: in STD_LOGIC;
           In0,In1,In2,In3,In4,In5,In6,In7: in STD_LOGIC_VECTOR (15 downto 0);
           Z: out STD_LOGIC_VECTOR (15 downto 0));
end mux8_16bit;

architecture Behavioral of mux8_16bit is

begin 
Z <= 	In0 after 5 ns when S2='0' and S1='0' and S0='0' else
		In1 after 5 ns when S2='0' and S1='0' and S0='1' else
		In2 after 5 ns when S2='0' and S1='1' and S0='0' else
		In3 after 5 ns when S2='0' and S1='1' and S0='1' else
		In4 after 5 ns when S2='1' and S1='0' and S0='0' else
		In5 after 5 ns when S2='1' and S1='0' and S0='1' else
		In6 after 5 ns when S2='1' and S1='1' and S0='0' else
		In7 after 5 ns when S2='1' and S1='1' and S0='1';
end Behavioral;

