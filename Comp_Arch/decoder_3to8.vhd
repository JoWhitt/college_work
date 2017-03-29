----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:41:01 02/14/2017 
-- Design Name: 
-- Module Name:    decoder_2to4 - Behavioral 
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

entity decoder_3to8 is
    	Port ( 	A0,A1,A2: in  STD_LOGIC;
           		Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7: out  STD_LOGIC );
end decoder_3to8;

architecture Behavioral of decoder_3to8 is
begin
	Q0 <=	((not A2) and (not A1)	and (not A0))	after 5 ns;
	Q1 <= ((not A2) and (not A1) 	and  A0) 		after 5 ns;
	Q2 <= ((not A2) and  A1 		and (not A0)) 	after 5 ns;
	Q3 <= ((not A2) and  A1 		and  A0) 		after 5 ns;
	Q4 <= ( A2 	    and (not A1) 	and (not A0))	after 5 ns;
	Q5 <= ( A2 	  	 and (not A1) 	and  A0) 		after 5 ns;
	Q6 <= ( A2 	    and  A1 		and (not A0)) 	after 5 ns;
	Q7 <= ( A2 	    and  A1 		and  A0) 		after 5 ns;
end Behavioral;
