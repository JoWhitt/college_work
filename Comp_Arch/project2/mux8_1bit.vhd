----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:14:28 04/07/2017 
-- Design Name: 
-- Module Name:    mux8_1bit - Behavioral 
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

entity mux8_1bit is
    Port ( in0,in1,in2,in3,in4,in5,in6,in7: in STD_LOGIC;
           s0,s1,s2: in STD_LOGIC;
           z: out STD_LOGIC);
end mux8_1bit;

architecture Behavioral of mux8_1bit is

begin
Z <= 	in0  after 1 ns when s2='0' and s1='0' and s0='0' else
		in1  after 1 ns when s2='0' and s1='0' and s0='1' else
		in2  after 1 ns when s2='0' and s1='1' and s0='0' else
		in3  after 1 ns when s2='0' and s1='1' and s0='1' else
		in4  after 1 ns when s2='1' and s1='0' and s0='0' else
		in5  after 1 ns when s2='1' and s1='0' and s0='1' else
		in6  after 1 ns when s2='1' and s1='1' and s0='0' else
		in7  after 1 ns when s2='1' and s1='1' and s0='1';

end Behavioral;

