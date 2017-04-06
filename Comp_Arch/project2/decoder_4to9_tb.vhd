--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:07:16 04/06/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/project2/decoder_4to9_tb.vhd
-- Project Name:  Project_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decoder_4to9
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
 
ENTITY decoder_4to9_tb IS
END decoder_4to9_tb;
 
ARCHITECTURE behavior OF decoder_4to9_tb IS 
   COMPONENT decoder_4to9
		PORT( In0,In1,In2,In3: in  STD_LOGIC;
				Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8: out  STD_LOGIC);
	END COMPONENT;

   --Inputs
   signal In0,In1,In2,In3 : std_logic := '0';
 	--Outputs
   signal Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8 : std_logic;
 
BEGIN
   uut: decoder_4to9 PORT MAP (
          In0 => In0,
          In1 => In1,
          In2 => In2,
          In3 => In3,
          Q0 => Q0,
          Q1 => Q1,
          Q2 => Q2,
          Q3 => Q3,
          Q4 => Q4,
          Q5 => Q5,
          Q6 => Q6,
          Q7 => Q7,
          Q8 => Q8
        );

   stim_proc: process
   begin		
      wait for 100 ns;
		In0<='0'; In1<='0'; In2<='0';		wait for 10 ns;
		In0<='1'; In1<='0'; In2<='0';		wait for 10 ns;
		In0<='0'; In1<='1'; In2<='0';		wait for 10 ns;
		In0<='1'; In1<='1'; In2<='0';		wait for 10 ns;
		In0<='0'; In1<='0'; In2<='1';		wait for 10 ns;
		In0<='1'; In1<='0'; In2<='1';		wait for 10 ns;
		In0<='0'; In1<='1'; In2<='1';		wait for 10 ns;
		In0<='1'; In1<='1'; In2<='1';		wait;
   end process;
END;
