--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:02:36 04/07/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/project2/extend_tb.vhd
-- Project Name:  Project_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: extend
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

ENTITY extend_tb IS
END extend_tb;
 
ARCHITECTURE behavior OF extend_tb IS 
 
    COMPONENT extend
    PORT(SR, DR : IN  std_logic_vector(2 downto 0);
         extended : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal SR : std_logic_vector(2 downto 0) := (others => '0');
   signal DR : std_logic_vector(2 downto 0) := (others => '0');
 	--Outputs
   signal extended : std_logic_vector(15 downto 0);
 
BEGIN
   uut: extend PORT MAP (
          SR => SR,
          DR => DR,
          extended => extended
   );

   stim_proc: process
   begin		
      wait for 100 ns;	
		SR <= "000";
		DR <= "000";	wait for 10 ns;
		DR <= "100";	wait for 10 ns;
		DR <= "111";	wait;
   end process;

END;
