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
USE ieee.numeric_std.ALL;

ENTITY register_file_9_tb IS
END register_file_9_tb;
 
ARCHITECTURE behavior OF register_file_9_tb IS 

    COMPONENT register_file_9
    PORT(  load_enable, CLK : in  STD_LOGIC;
           DA,AA,BA: in STD_LOGIC_VECTOR(3 downto 0);
           DData : in  STD_LOGIC_VECTOR (15 downto 0);
           A,B : out  STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;
    
   --Inputs
   signal load_enable, CLK : std_logic := '0';
   signal DA,AA,BA : std_logic_vector(3 downto 0) := (others => '0');
   signal DData : std_logic_vector(15 downto 0) := (others => '0');
 	--Outputs
   signal A, B : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
   uut: register_file_9 PORT MAP (
          load_enable => load_enable,
          CLK => CLK,
          DA => DA,
          AA => AA,
          BA => BA,
          DData => DData,
          A => A,
          B => B
   );

   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
   stim_proc: process
   begin		
      wait for 100 ns;
		load_enable <= '0';
		DData <= "0000000000000000";
		DA <= "0000";
		
		--set registers to unique values
		--set 0
		load_enable <= '1';		wait for CLK_period*2;
		load_enable <= '0';		wait for CLK_period;

		--set 1 to 8
		for i in 0 to 7 loop
			load_enable <= '0';
			DData <= std_logic_vector (unsigned(DData) +1);
			DA <= std_logic_vector (unsigned(DA) +1);	wait for CLK_period;
			load_enable <= '1';														wait for CLK_period*2;
			load_enable <= '0';														wait for CLK_period;
		end loop;																		wait for CLK_period*2;
		
		--read each register
		load_enable <= '0';
		AA <= "0000";
		BA <= "0000";
		for i in 0 to 8 loop
			wait for CLK_period*4;
			AA <= std_logic_vector (unsigned(AA) +1);
			BA <= std_logic_vector (unsigned(BA) +1);
		end loop;		
      wait;
   end process;

END;
