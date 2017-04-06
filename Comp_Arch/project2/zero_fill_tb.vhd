--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:42:46 04/06/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/project2/zero_fill_tb.vhd
-- Project Name:  Project_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: zero_fill
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY zero_fill_tb IS
END zero_fill_tb;
 
ARCHITECTURE behavior OF zero_fill_tb IS 

    COMPONENT zero_fill
    PORT(	input : IN  std_logic_vector(2 downto 0);
				output : OUT  std_logic_vector(15 downto 0));
    END COMPONENT;
    
   --Inputs
   signal input : std_logic_vector(2 downto 0) := (others => '0');
 	--Outputs
   signal output : std_logic_vector(15 downto 0);
 
BEGIN
   uut: zero_fill PORT MAP (
      input => input,
      output => output
   );

   stim_proc: process
   begin
      wait for 100 ns;	
		input <= "000";	wait for 10 ns;
		input <= "110";	wait for 10 ns;
		input <= "111";	wait;
   end process;

END;
