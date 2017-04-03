--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:05:14 04/01/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/Project_2/P2_Multicoded_instruction_set_processor/mux9_16bit_tb.vhd
-- Project Name:  P2_Multicoded_instruction_set_processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux9_16bit
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
ENTITY mux9_16bit_tb IS
END mux9_16bit_tb;
 
ARCHITECTURE behavior OF mux9_16bit_tb IS 
    COMPONENT mux9_16bit
    PORT( s0,s1,s2,s3 : IN  std_logic;
          in0,in1,in2,in3,in4,in5,in6,in7,in8 : IN  std_logic_vector(15 downto 0);
          z : OUT std_logic_vector(15 downto 0));
    END COMPONENT;
    
   --Inputs
   signal s0,s1,s2,s3 : std_logic := '0';
   signal in0,in1,in2,in3,in4,in5,in6,in7,in8 : std_logic_vector(15 downto 0) := (others => '0');
 	--Outputs
   signal z : std_logic_vector(15 downto 0) := (others => '0');
 
BEGIN
   uut: mux9_16bit PORT MAP (
          s0 => s0,
          s1 => s1,
          s2 => s2,
          s3 => s3,
          in0 => in0,
          in1 => in1,
          in2 => in2,
          in3 => in3,
          in4 => in4,
          in5 => in5,
          in6 => in6,
          in7 => in7,
          in8 => in8,
          z => z
        );
 
   stim_proc: process
   begin		
      wait for 100 ns;	
		in0 <= "0000000000000011";
		in1 <= "0000000000001100";
		in2 <= "0000000000110000";
		in3 <= "0000000011000000";
		in4 <= "0000001100000000";
		in5 <= "0000110000000000";
		in6 <= "0011000000000000";
		in7 <= "1100000000000000";
		in8 <= "0011001100110011";

		s0<='0'; s1<='0'; s2<='0'; s3<='0';		wait for 10 ns;
		s0<='1'; s1<='0'; s2<='0'; s3<='0';		wait for 10 ns;
		s0<='0'; s1<='1'; s2<='0'; s3<='0';		wait for 10 ns;
		s0<='1'; s1<='1'; s2<='0'; s3<='0';		wait for 10 ns;
		s0<='0'; s1<='0'; s2<='1'; s3<='0';		wait for 10 ns;
		s0<='1'; s1<='0'; s2<='1'; s3<='0';		wait for 10 ns;
		s0<='0'; s1<='1'; s2<='1'; s3<='0';		wait for 10 ns;
		s0<='1'; s1<='1'; s2<='1'; s3<='0';		wait for 10 ns;
		s0<='0'; s1<='0'; s2<='0'; s3<='1';		wait;
   end process;

END;
