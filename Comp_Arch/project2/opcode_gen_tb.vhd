--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:15:59 04/07/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/project2/opcode_gen_tb.vhd
-- Project Name:  Project_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: opcode_generator
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

ENTITY opcode_gen_tb IS
END opcode_gen_tb;
 
ARCHITECTURE behavior OF opcode_gen_tb IS 

    COMPONENT opcode_generator
    PORT ( IL : in  STD_LOGIC;
           IR : in  STD_LOGIC_VECTOR (15 downto 0);
           opcode : out  STD_LOGIC_VECTOR (7 downto 0);
           DR, SA, SB : out  STD_LOGIC_VECTOR (2 downto 0));
    END COMPONENT;
    
   --Inputs
   signal IL : std_logic := '0';
   signal IR : std_logic_vector(15 downto 0) := (others => '0');
 	--Outputs
   signal opcode : std_logic_vector(7 downto 0);
   signal DR, SA, SB : std_logic_vector(2 downto 0);
 
BEGIN
   uut: opcode_generator PORT MAP (
          IL => IL,
          IR => IR,
          opcode => opcode,
          DR => DR,
          SA => SA,
          SB => SB
   );

   stim_proc: process
   begin		
      wait for 100 ns;	
		
		IL <= '0';
		IR <= "1111111111111111";		wait for 10 ns;
		IL <= '1';
		IR <= "1111111111111111";		wait for 10 ns;
		
		IR <= "1111111111110000";		wait for 10 ns;
		IR <= "0000111111111111";		wait for 10 ns;
		IR <= "0000000000000001";		wait for 10 ns;
		IR <= "0000000000000000";		wait;
   end process;

END;
