----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:49:20 03/14/2017 
-- Design Name: 
-- Module Name:    mux16_16bit - Behavioral 
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
entity mux16_1bit is
    Port ( input: in STD_LOGIC_VECTOR(15 to 0);
			  --in0,in1,in2,in3,in4,in5,in6,in7,in8: in STD_LOGIC_VECTOR;
			  --  in9,in10,in11,in12,in13,in14,in15: in STD_LOGIC_VECTOR;
           s0,s1,s2,s3: in STD_LOGIC;
           z: out STD_LOGIC);
end mux16_16bit;

architecture Behavioral of mux16_16bit is

begin
Z <= 	input(0)  after 5 ns when s3='0' and s2='0' and s1='0' and s0='0' else
		input(1)  after 5 ns when s3='0' and s2='0' and s1='0' and s0='1' else
		input(2)  after 5 ns when s3='0' and s2='0' and s1='1' and s0='0' else
		input(3)  after 5 ns when s3='0' and s2='0' and s1='1' and s0='1' else
		input(4)  after 5 ns when s3='0' and s2='1' and s1='0' and s0='0' else
		input(5)  after 5 ns when s3='0' and s2='1' and s1='0' and s0='1' else
		input(6)  after 5 ns when s3='0' and s2='1' and s1='1' and s0='0' else
		input(7)  after 5 ns when s3='0' and s2='1' and s1='1' and s0='1' else
		input(8)  after 5 ns when s3='1' and s2='0' and s1='0' and s0='0' else
		input(9)  after 5 ns when s3='1' and s2='0' and s1='0' and s0='1' else
		input(10) after 5 ns when s3='1' and s2='0' and s1='1' and s0='0' else
		input(11) after 5 ns when s3='1' and s2='0' and s1='1' and s0='1' else
		input(12) after 5 ns when s3='1' and s2='1' and s1='0' and s0='0' else
		input(13) after 5 ns when s3='1' and s2='1' and s1='0' and s0='1' else
		input(14) after 5 ns when s3='1' and s2='1' and s1='1' and s0='0' else
		input(15) after 5 ns when s3='1' and s2='1' and s1='1' and s0='1';

end Behavioral;

