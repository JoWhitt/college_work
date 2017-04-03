----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:42:32 03/14/2017 
-- Design Name: 
-- Module Name:    full_adder - Behavioral 
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

entity full_adder is
    Port ( A: in  STD_LOGIC;
           B: in  STD_LOGIC;
           c_in: in  STD_LOGIC;
           c_out: out  STD_LOGIC;
           Sum: out  STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is

begin
c_out	<= (A and B) or ((A xor B) and c_in)	after 1 ns;
Sum	<= ((A xor B) xor c_in)						after 1 ns;

end Behavioral;

