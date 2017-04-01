--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:10:16 03/25/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/Project_2/P2_Multicoded_instruction_set_processor/ripple_adder_tb.vhd
-- Project Name:  P2_Multicoded_instruction_set_processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ripple_adder_16bit
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

ENTITY ripple_adder_tb IS
END ripple_adder_tb;
 
ARCHITECTURE behavior OF ripple_adder_tb IS 
   COMPONENT ripple_adder_16bit
		 PORT ( Ain, Bin : in  STD_LOGIC_VECTOR (15 downto 0);
				  C_in : in  STD_LOGIC;
				  C_out, V_out : out  STD_LOGIC;
				  Z : out  STD_LOGIC_VECTOR (15 downto 0));
   END COMPONENT;
    
   --Inputs
   signal Ain, Bin : std_logic_vector(15 downto 0) := (others => '0');
   signal C_in : std_logic := '0';
 	--Outputs
   signal C_out, V_out : std_logic;
   signal Z : std_logic_vector(15 downto 0);
 
BEGIN
   uut: ripple_adder_16bit PORT MAP (
          Ain => Ain,
          Bin => Bin,
          C_in => C_in,
          C_out => C_out,
          V_out => V_out,
          Z => Z
        );

   stim_proc: process
   begin		
      wait for 100 ns;	

		--C=0 V=0
		Ain <= "1111000011110000";
		Bin <= "0000111100001111";
		C_in <= '0';
		wait for 10 ns;
		
		--C=1 V=0
		Ain <= "1111111100000000";
		Bin <= "0001000000000000";
		C_in <= '0';
		wait for 10 ns;
		
		--C=0 V=1
		Ain <= "0100000000000000";
		Bin <= "0100000000000000";
		C_in <= '0';
		wait for 10 ns;
		
		--C=1 V=1
		Ain <= "1100000000000000";
		Bin <= "1000000000000000";
		C_in <= '0';
      wait;
   end process;

END;
