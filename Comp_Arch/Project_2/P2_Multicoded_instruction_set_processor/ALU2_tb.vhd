--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:59:27 03/21/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/ALU2_tb.vhd
-- Project Name:  Project_1A
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: arithmetic_logic_unit_2
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
ENTITY ALU2_tb IS
END ALU2_tb;
 
ARCHITECTURE behavior OF ALU2_tb IS 
 
    COMPONENT arithmetic_logic_unit_2
    PORT(	dataA, dataB : in  STD_LOGIC_VECTOR (15 downto 0);
			FS_code : in  STD_LOGIC_VECTOR (4 downto 0);
			V, C_out : out  STD_LOGIC;
			dataG : out  STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;
    
   --Inputs
   signal dataA,dataB : std_logic_vector(15 downto 0) := (others => '0');
   signal FS_code : std_logic_vector(4 downto 0) := (others => '0');
 	--Outputs
   signal V,C_out : std_logic;
   signal dataG : std_logic_vector(15 downto 0);

BEGIN
   uut: arithmetic_logic_unit_2 PORT MAP (
	  dataA => dataA,
	  dataB => dataB,
	  FS_code => FS_code,
	  V => V,
	  C_out => C_out,
	  dataG => dataG
   );
 
   stim_proc: process
   begin		
      wait for 10 ns;	
		dataA <= "0000111100000000";
		dataB <= "0011000011110000";
		
		wait for 10 ns;	FS_code <= "00000";
		wait for 10 ns; FS_code <= "00001";
		wait for 10 ns; FS_code <= "00010";
		wait for 10 ns;	FS_code <= "00011";
		wait for 10 ns;	FS_code <= "00100";
		wait for 10 ns;	FS_code <= "00101";
		wait for 10 ns;	FS_code <= "00110";
		wait for 10 ns;	FS_code <= "00111";
		
		wait for 10 ns; FS_code <= "01000";
		wait for 10 ns; FS_code <= "01010";
		wait for 10 ns; FS_code <= "01100";
		wait for 10 ns; FS_code <= "01110";	
		wait;
   end process;
END;