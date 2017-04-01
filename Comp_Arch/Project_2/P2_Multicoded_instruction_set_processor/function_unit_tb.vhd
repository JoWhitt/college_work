--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:29:37 03/22/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/function_unit_tb.vhd
-- Project Name:  Project_1A
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: function_unit
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
 
ENTITY function_unit_tb IS
END function_unit_tb;
 
ARCHITECTURE behavior OF function_unit_tb IS 
 
    COMPONENT function_unit
    PORT ( busA, busB : in  STD_LOGIC_VECTOR (15 downto 0);
           FSel : in  STD_LOGIC_VECTOR (4 downto 0);
           V, C, N, Z : out  STD_LOGIC;
           F : out  STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;
    
   --Inputs
   signal busA, busB : std_logic_vector(15 downto 0) := (others => '0');
   signal FSel : std_logic_vector(4 downto 0) := (others => '0');
 	--Outputs
   signal V, C, N, Z : std_logic;
   signal F : std_logic_vector(15 downto 0);
 
BEGIN
   uut: function_unit PORT MAP (
          busA => busA,
          busB => busB,
          FSel => FSel,
          V => V,
          C => C,
          N => N,
          Z => Z,
          F => F
        );
 
   stim_proc: process
   begin		
      wait for 100 ns;
		
		--Test arithmetic functions
		busA <= "0000111100000000";
		busB <= "0000000011110000";
		wait for 10 ns;	FSel <= "00000";
		wait for 10 ns; 	FSel <= "00001";
		wait for 10 ns; 	FSel <= "00010";
		wait for 10 ns;	FSel <= "00011";
		wait for 10 ns;	FSel <= "00100";
		wait for 10 ns;	FSel <= "00101";
		wait for 10 ns;	FSel <= "00110";
		wait for 10 ns;	FSel <= "00111";
		
		--Test logical functions
		busA <= "0000111100001111";
		busB <= "0000000011111111";
		wait for 10 ns; 	FSel <= "01000";
		wait for 10 ns; 	FSel <= "01010";
		wait for 10 ns; 	FSel <= "01100";
		wait for 10 ns; 	FSel <= "01110"; 
		
		--Test shifter 
		busB <= "0000000000000011";
		wait for 10 ns; 	FSel <= "10000";
		wait for 10 ns; 	FSel <= "10100";
		wait for 10 ns; 	FSel <= "11000";

      wait;
   end process;

END;
