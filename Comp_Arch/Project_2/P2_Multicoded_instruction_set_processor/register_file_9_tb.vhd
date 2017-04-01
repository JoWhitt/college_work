--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:36:57 04/01/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/Project_2/P2_Multicoded_instruction_set_processor/register_file_9_tb.vhd
-- Project Name:  P2_Multicoded_instruction_set_processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: register_file_9
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
ENTITY register_file_9_tb IS
END register_file_9_tb;
 
ARCHITECTURE behavior OF register_file_9_tb IS 

    COMPONENT register_file_9
    PORT(  load_enable, CLK : in  STD_LOGIC;
           dest_select0, dest_select1, dest_select2, TD: in STD_LOGIC;
			  Asel0, Asel1, Asel2, TA: in STD_LOGIC;
			  Bsel0, Bsel1, Bsel2, TB : in  STD_LOGIC;
           DData : in  STD_LOGIC_VECTOR (15 downto 0);
           AData, BData : out  STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;
    
   --Inputs
   signal load_enable, CLK : std_logic := '0';
   signal dest_select0, dest_select1, dest_select2, TD : std_logic := '0';
   signal Asel0, Asel1, Asel2, TA : std_logic := '0';
   signal Bsel0, Bsel1, Bsel2, TB : std_logic := '0';
   signal DData : std_logic_vector(15 downto 0) := (others => '0');
 	--Outputs
   signal AData, BData : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file_9 PORT MAP (
          load_enable => load_enable,
          CLK => CLK,
          dest_select0 => dest_select0,
          dest_select1 => dest_select1,
          dest_select2 => dest_select2,
          TD => TD,
          Asel0 => Asel0,
          Asel1 => Asel1,
          Asel2 => Asel2,
          TA => TA,
          Bsel0 => Bsel0,
          Bsel1 => Bsel1,
          Bsel2 => Bsel2,
          TB => TB,
          DData => DData,
          AData => AData,
          BData => BData
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
