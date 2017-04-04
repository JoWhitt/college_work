--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:01:37 04/04/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/Project_2/Project_2/register_file_8_tb.vhd
-- Project Name:  Project_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: register_file_8
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

ENTITY register_file_8_tb IS
END register_file_8_tb;
 
ARCHITECTURE behavior OF register_file_8_tb IS 
 
    COMPONENT register_file_8
    PORT(	destAddress,srcAddress : IN  std_logic_vector(2 downto 0);
				DataIn : IN  std_logic_vector(15 downto 0);
				load_enable : IN  std_logic;
				CLK : IN  std_logic;
				DataOut : OUT  std_logic_vector(15 downto 0));
    END COMPONENT;

   --Inputs
   signal destAddress,srcAddress : std_logic_vector(2 downto 0) := (others => '0');
   signal DataIn : std_logic_vector(15 downto 0) := (others => '0');
   signal load_enable,CLK : std_logic := '0';
 	--Outputs
   signal DataOut : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
   uut: register_file_8 PORT MAP (
          destAddress => destAddress,
			 srcAddress => srcAddress,
          DataIn => DataIn,
          load_enable => load_enable,
          CLK => CLK,
          DataOut => DataOut
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
		DataIn <= "0000000000000000";
		destAddress <= "000";
		
		--set registers to unique values
		for i in 0 to 7 loop
			wait for CLK_period*1;
			load_enable <= '0';
			wait for CLK_period*2;
			DataIn <= std_logic_vector (unsigned(DataIn) +1);
			destAddress <= std_logic_vector (unsigned(destAddress) +1);
			wait for CLK_period*2;
			load_enable <= '1';
		end loop;
		wait for CLK_period*4;
		
		load_enable <= '0';
		--read each register
		srcAddress <= "000";
		for i in 0 to 7 loop
			wait for CLK_period*4;
			srcAddress <= std_logic_vector (unsigned(srcAddress) +1);
		end loop;

      wait;
   end process;
END;
