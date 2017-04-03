--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:55:30 03/14/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/full_adder_tb.vhd
-- Project Name:  Project_1A
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: full_adder
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
 
ENTITY full_adder_tb IS
END full_adder_tb;
 
ARCHITECTURE behavior OF full_adder_tb IS 
    COMPONENT full_adder
    PORT( A : IN  std_logic;
          B : IN  std_logic;
          c_in : IN  std_logic;
          c_out : OUT  std_logic;
          Sum : OUT  std_logic );
    END COMPONENT;

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal c_in : std_logic := '0';
 	--Outputs
   signal c_out : std_logic;
   signal Sum : std_logic;
 
BEGIN
   uut: full_adder PORT MAP (
          A => A,
          B => B,
          c_in => c_in,
          c_out => c_out,
          Sum => Sum
   );

   stim_proc: process
   begin
		wait for 100 ns;
		A <= '0';
		B <= '0';
		c_in <= '1';
		
		--loop through A values
		for i in 0 to 1 loop
			--loop through B values
			for j in 0 to 1 loop
				--loop through c_in values
				for k in 0 to 1 loop
					wait for 10 ns;
					c_in <= not c_in;
				end loop;
				B <= not B;
			end loop;
			A <= not A;
		end loop;
		wait;
   end process;
END;
