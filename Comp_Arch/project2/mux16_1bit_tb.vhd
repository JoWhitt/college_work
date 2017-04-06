--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:16:17 03/21/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/mux16_1bit_tb.vhd
-- Project Name:  Project_1A
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux16_1bit
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

ENTITY mux16_1bit_tb IS
END mux16_1bit_tb;
 
ARCHITECTURE behavior OF mux16_1bit_tb IS 
 
    COMPONENT mux16_1bit
    PORT(	in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15: in STD_LOGIC;
				s0,s1,s2,s3: in STD_LOGIC;
				z : OUT  std_logic );
    END COMPONENT;

   --Inputs
   signal in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15 : std_logic := '0';
   signal s0,s1,s2,s3 : std_logic := '0';

 	--Outputs
   signal z : std_logic;
 
BEGIN
   uut: mux16_1bit PORT MAP (
          in0 => in0,
          in1 => in1,
          in2 => in2,
          in3 => in3,
          in4 => in4,
          in5 => in5,
          in6 => in6,
          in7 => in7,
          in8 => in8,
          in9 => in9,
          in10 => in10,
          in11 => in11,
          in12 => in12,
          in13 => in13,
          in14 => in14,
          in15 => in15,
          s0 => s0,
          s1 => s1,
          s2 => s2,
          s3 => s3,
          z => z
        ); 

   stim_proc: process
   begin		
		wait for 100 ns;	
		in0<='0'; in1<='0'; in2<='1'; in3<='1';
		in4<='0'; in5<='0'; in6<='1'; in7<='1';
		in8<='0'; in9<='0'; in10<='1'; in11<='1';
		in12<='0'; in13<='0'; in14<='1'; in15<='1';
		 
		s0<='0'; s1<='0'; s2<='0'; s3<='0'; 	wait for 10 ns;
		s0<='1'; s1<='0'; s2<='0'; s3<='0'; 	wait for 10 ns;
		s0<='0'; s1<='1'; s2<='0'; s3<='0'; 	wait for 10 ns;
		s0<='1'; s1<='1'; s2<='0'; s3<='0'; 	wait for 10 ns;
		s0<='0'; s1<='0'; s2<='1'; s3<='0'; 	wait for 10 ns;
		s0<='1'; s1<='0'; s2<='1'; s3<='0'; 	wait for 10 ns;
		s0<='0'; s1<='1'; s2<='1'; s3<='0'; 	wait for 10 ns;
		s0<='1'; s1<='1'; s2<='1'; s3<='0'; 	wait for 10 ns;
		s0<='0'; s1<='0'; s2<='0'; s3<='1'; 	wait for 10 ns;
		s0<='1'; s1<='0'; s2<='0'; s3<='1'; 	wait for 10 ns;
		s0<='0'; s1<='1'; s2<='0'; s3<='1'; 	wait for 10 ns;
		s0<='1'; s1<='1'; s2<='0'; s3<='1'; 	wait for 10 ns;
		s0<='0'; s1<='0'; s2<='1'; s3<='1'; 	wait for 10 ns;
		s0<='1'; s1<='0'; s2<='1'; s3<='1'; 	wait for 10 ns;
		s0<='0'; s1<='1'; s2<='1'; s3<='1'; 	wait for 10 ns;
		s0<='1'; s1<='1'; s2<='1'; s3<='1'; 	wait;
   end process;
END;
