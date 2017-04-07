--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:31:52 04/07/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/project2/mux2_8bit_tb.vhd
-- Project Name:  Project_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux2_8bit
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
 
ENTITY mux2_8bit_tb IS
END mux2_8bit_tb;
 
ARCHITECTURE behavior OF mux2_8bit_tb IS 
    COMPONENT mux2_8bit
    PORT ( S: in  STD_LOGIC;
           In0, In1: in  STD_LOGIC_VECTOR (7 downto 0);
           Z: out  STD_LOGIC_VECTOR (7 downto 0));
    END COMPONENT;
    
   --Inputs
   signal S : std_logic := '0';
   signal In0, In1 : std_logic_vector(7 downto 0) := (others => '0');
 	--Outputs
   signal Z : std_logic_vector(7 downto 0);
 
BEGIN
   uut: mux2_8bit PORT MAP (
          S => S,
          In0 => In0,
          In1 => In1,
          Z => Z
   );
		  
   stim_proc: process
   begin		
      wait for 100 ns;	
		In0 <= "00000000";
		In1 <= "11111111";	
		
		S <= '0';	wait for 10 ns;	
		S <= '1';	wait;	
      wait;
   end process;

END;
