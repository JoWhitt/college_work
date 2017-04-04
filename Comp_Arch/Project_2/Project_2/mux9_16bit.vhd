----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:41:45 04/01/2017 
-- Design Name: 
-- Module Name:    mux9_16bit - Behavioral 
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

entity mux9_16bit is
    Port ( s0,s1,s2,s3 : in  STD_LOGIC;
           in0,in1,in2,in3,in4,in5,in6,in7,in8 : in  STD_LOGIC_VECTOR (15 downto 0);
           z : out STD_LOGIC_VECTOR (15 downto 0));
end mux9_16bit;

architecture Behavioral of mux9_16bit is

begin
Z <= 	in0 after 1 ns when s3='0' and s2='0' and s1='0' and s0='0' else
		in1 after 1 ns when s3='0' and s2='0' and s1='0' and s0='1' else
		in2 after 1 ns when s3='0' and s2='0' and s1='1' and s0='0' else
		in3 after 1 ns when s3='0' and s2='0' and s1='1' and s0='1' else
		in4 after 1 ns when s3='0' and s2='1' and s1='0' and s0='0' else
		in5 after 1 ns when s3='0' and s2='1' and s1='0' and s0='1' else
		in6 after 1 ns when s3='0' and s2='1' and s1='1' and s0='0' else
		in7 after 1 ns when s3='0' and s2='1' and s1='1' and s0='1' else
		in8 after 1 ns when s3='1' and s2='0' and s1='0' and s0='0';
end Behavioral;

