--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:14:24 02/22/2017
-- Design Name:   
-- Module Name:   U:/Comp_Arch/decoder_3to8_tb.vhd
-- Project Name:  Project_1A
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decoder_3to8
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
 
ENTITY decoder_3to8_tb IS
END decoder_3to8_tb;
 
ARCHITECTURE behavior OF decoder_3to8_tb IS
    COMPONENT decoder_3to8
    PORT(	A0,A1,A2: in  STD_LOGIC;
		Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7: out  STD_LOGIC );
    END COMPONENT;
    
   --Inputs
   signal A0 : std_logic := '0';
   signal A1 : std_logic := '0';
   signal A2 : std_logic := '0';
	--Outputs
	signal Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7: std_logic;

BEGIN
   	uut: decoder_3to8 PORT MAP (
			A0 => A0,
			A1 => A1,
			A2 => A2,
			Q0 => Q0,
			Q1 => Q1,
			Q2 => Q2,
			Q3 => Q3,
			Q4 => Q4,
			Q5 => Q5,
			Q6 => Q6,
			Q7 => Q7
      );
		  
 stim_proc: process
 begin		
      wait for 100 ns;	
		
		A0<='0'; A1<='0'; A2<='0';		wait for 10 ns;
		A0<='1'; A1<='0'; A2<='0';		wait for 10 ns;
		A0<='0'; A1<='1'; A2<='0';		wait for 10 ns;
		A0<='1'; A1<='1'; A2<='0';		wait for 10 ns;
		A0<='0'; A1<='0'; A2<='1';		wait for 10 ns;
		A0<='1'; A1<='0'; A2<='1';		wait for 10 ns;
		A0<='0'; A1<='1'; A2<='1';		wait for 10 ns;
		A0<='1'; A1<='1'; A2<='1';		wait;
   	end process;
END;
