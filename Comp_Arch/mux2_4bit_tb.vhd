--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:26:31 02/22/2017
-- Design Name:   
-- Module Name:   U:/Comp_Arch/mux2_4bit_tb.vhd
-- Project Name:  Project_1A
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux2_4bit
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
 
ENTITY mux2_4bit_tb IS
END mux2_4bit_tb;
 
ARCHITECTURE behavior OF mux2_4bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT mux2_4bit
    PORT(  S: in  STD_LOGIC;
           In0, In1: in  STD_LOGIC_VECTOR (15 downto 0);
           Z: out  STD_LOGIC_VECTOR (15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal S : std_logic := '0';
   signal In0 : std_logic_vector(15 downto 0) := (others => '0');
   signal In1 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Z : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux2_4bit PORT MAP (
          S => S,
          In0 => In0,
          In1 => In1,
          Z => Z
        );

   -- Stimulus process
   stim_proc: process
   begin		
		In0 <= "0000000000000000";
		In1 <= "1111111111111111";	
		
      S <= '0';
		wait for 100 ns;	
		
      S <= '1';
		wait for 100 ns;		
   end process;

END;
