--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:21:30 03/18/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/zero_detect_tb.vhd
-- Project Name:  Project_1A
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: zero_detect_16
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
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

    component shifter_16bit
	 Port ( input: in STD_LOGIC_VECTOR(15 downto 0);
           sel0,sel1,sel2,sel3 : in  STD_LOGIC;
           y: out STD_LOGIC_VECTOR(15 downto 0) );
	 end component;
	 
  -- INPUT
	 signal input: std_logic_vector(15 downto 0) := (others => '0');
	 signal sel0,sel1,sel2,sel3 : STD_LOGIC := '0';
	 
  -- OUTPUT
	 signal y: std_logic_vector(15 downto 0);

  BEGIN
  -- UUT Instantiation
	 uut: shifter_16bit PORT MAP(
			input => input,
			sel0 => sel0,
			sel1 => sel1,
			sel2 => sel2,
			sel3 => sel3,
			y => y
	 );

    tb : PROCESS
    BEGIN
			wait for 10 ns;
			input <= "0000000000000001";
			sel0 <= '0';
			sel1 <= '0';
			sel2 <= '0';
			sel3 <= '0';
			
			wait for 10 ns;
			sel0 <= '1';
			sel1 <= '0';
			sel2 <= '0';
			sel3 <= '0';
			
			wait for 10 ns;
			sel0 <= '0';
			sel1 <= '1';
			sel2 <= '0';
			sel3 <= '0';
			
			wait for 10 ns;
			sel0 <= '1';
			sel1 <= '1';
			sel2 <= '0';
			sel3 <= '0';
			
			wait for 10 ns;
			sel0 <= '0';
			sel1 <= '0';
			sel2 <= '1';
			sel3 <= '0';
			
			wait for 10 ns;
			sel0 <= '1';
			sel1 <= '0';
			sel2 <= '1';
			sel3 <= '0';
			
			wait for 10 ns;
			sel0 <= '0';
			sel1 <= '1';
			sel2 <= '1';
			sel3 <= '0';
			
			wait for 10 ns;
			sel0 <= '1';
			sel1 <= '1';
			sel2 <= '1';
			sel3 <= '0';
			
			wait for 10 ns;
			sel0 <= '0';
			sel1 <= '0';
			sel2 <= '0';
			sel3 <= '1';
			
			wait for 10 ns;
			sel0 <= '1';
			sel1 <= '0';
			sel2 <= '0';
			sel3 <= '1';
			
			wait for 10 ns;
			sel0 <= '0';
			sel1 <= '1';
			sel2 <= '0';
			sel3 <= '1';
			
			wait for 10 ns;
			sel0 <= '1';
			sel1 <= '1';
			sel2 <= '0';
			sel3 <= '1';
			
			wait for 10 ns;
			sel0 <= '0';
			sel1 <= '0';
			sel2 <= '1';
			sel3 <= '1';
			
			wait for 10 ns;
			sel0 <= '1';
			sel1 <= '0';
			sel2 <= '1';
			sel3 <= '1';
			
			wait for 10 ns;
			sel0 <= '0';
			sel1 <= '1';
			sel2 <= '1';
			sel3 <= '1';
			
			wait for 10 ns;
			sel0 <= '1';
			sel1 <= '1';
			sel2 <= '1';
			sel3 <= '1';
			wait;
    END PROCESS tb;
  END;
