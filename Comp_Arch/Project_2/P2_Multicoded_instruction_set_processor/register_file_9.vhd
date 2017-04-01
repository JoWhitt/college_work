----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:12:29 04/01/2017 
-- Design Name: 
-- Module Name:    register_file_9 - Behavioral 
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

entity register_file_9 is
    PORT(  load_enable, CLK : in  STD_LOGIC;
           dest_select0, dest_select1, dest_select2, TD: in STD_LOGIC;
			  Asel0, Asel1, Asel2, TA: in STD_LOGIC;
			  Bsel0, Bsel1, Bsel2, TB : in  STD_LOGIC;
           DData : in  STD_LOGIC_VECTOR (15 downto 0);
           AData, BData : out  STD_LOGIC_VECTOR (15 downto 0));
end register_file_9;

architecture Behavioral of register_file_9 is
--COMPONENTS
	component decoder9_16bit is
   --TODO
	end component;
	
	component reg
   Port (  D: in STD_LOGIC_VECTOR (15 downto 0);
           load, CLK: in STD_LOGIC;
           Q: out STD_LOGIC_VECTOR (15 downto 0) );
	end component;
	
	component mux9_16bit is
	--TODO
	end component;



begin


end Behavioral;

