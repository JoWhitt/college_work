----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:35:57 04/01/2017 
-- Design Name: 
-- Module Name:    decoder_4to9 - Behavioral 
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

entity decoder_4to9 is
    Port ( In0,In1,In2,In3: in  STD_LOGIC;
           Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8: out  STD_LOGIC);
end decoder_4to9;

architecture Behavioral of decoder_4to9 is

begin
	Q0 <=	((not In3) and (not In2) and (not In1)	and (not In0))	after 1 ns;
	Q1 <= ((not In3) and (not In2) and (not In1) and  In0) 		after 1 ns;
	Q2 <= ((not In3) and (not In2) and  In1 		and (not In0)) after 1 ns;
	Q3 <= ((not In3) and (not In2) and  In1 		and  In0) 		after 1 ns;
	Q4 <= ((not In3) and  In2 	  	 and (not In1) and (not In0))	after 1 ns;
	Q5 <= ((not In3) and  In2 	  	 and (not In1) and  In0) 		after 1 ns;
	Q6 <= ((not In3) and  In2 	  	 and  In1 		and (not In0)) after 1 ns;
	Q7 <= ((not In3) and  In2 	  	 and  In1 		and  In0) 		after 1 ns;
	Q8 <= (In3 		  and (not In2) and (not In1)	and (not In0))	after 1 ns;

end Behavioral;

