--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:21:30 03/18/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/zero_detect_tb.vhd
-- Project Name:  Project_1A
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: zero_detect_16
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
 
ENTITY zero_detect_tb IS
END zero_detect_tb;
 
ARCHITECTURE behavior OF zero_detect_tb IS 
 
   -- Component Declaration for the Unit Under Test (UUT)
   COMPONENT zero_detect_16
   PORT(
         data : IN  std_logic_vector(15 downto 0);
         z : OUT  std_logic
        );
   END COMPONENT;
    
   --SIGNALS
   signal data : std_logic_vector(15 downto 0) := (others => '0');
   signal z : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: zero_detect_16 PORT MAP (
          data => data,
          z => z
   );

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;	

		data <= "0000000000000001";
		wait for 10 ns;
		
		data <= "0000000000000000";
		wait for 10 ns;
		
		data <= "1000000000000000";
		wait for 10 ns;
		
		data <= "0000000000000000";
		wait for 10 ns;
		
		data <= "1111111111111111";
		wait for 10 ns;
		
		data <= "0000000000000000";
		wait for 10 ns;

      wait;
   end process;

END;
