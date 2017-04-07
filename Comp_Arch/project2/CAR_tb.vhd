--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:38:12 04/07/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/project2/CAR_tb.vhd
-- Project Name:  Project_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CAR
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
ENTITY CAR_tb IS
END CAR_tb;
 
ARCHITECTURE behavior OF CAR_tb IS 

    COMPONENT CAR
    PORT(	muxCOut : IN  std_logic_vector(7 downto 0);
				muxSOut : IN  std_logic;
				output : OUT  std_logic_vector(7 downto 0));
    END COMPONENT;
    
   --Inputs
   signal muxCOut : std_logic_vector(7 downto 0) := (others => '0');
   signal muxSOut : std_logic := '0';
 	--Outputs
   signal output : std_logic_vector(7 downto 0);
 
BEGIN
   uut: CAR PORT MAP (
          muxCOut => muxCOut,
          muxSOut => muxSOut,
          output => output
   );
 
   stim_proc: process
   begin		
      wait for 100 ns;	
		
		muxSOut <= '1';
		muxCOut <= "11111111";	wait for 10 ns;
		
		muxSOut <= '0';
		muxCOut <= "11111111";	wait;
   end process;

END;
