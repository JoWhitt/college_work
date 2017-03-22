--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:25:04 03/11/2017
-- Design Name:   
-- Module Name:   U:/Comp_Arch/register_file_v2_tb.vhd
-- Project Name:  Project_1A
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: register_file_v2
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
 
ENTITY register_file_v2_tb IS
END register_file_v2_tb;
 
ARCHITECTURE behavior OF register_file_v2_tb IS 
 
    COMPONENT register_file_v2
    PORT(  load_enable, CLK : in  STD_LOGIC;
           dest_select, Asel, Bsel : in  STD_LOGIC_VECTOR(2 downto 0);
           DData : in  STD_LOGIC_VECTOR (15 downto 0);
           AData, BData : out  STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;
    
   --Inputs
   signal load_enable: std_logic := '0';
	signal CLK: std_logic:= '0';
   signal dest_select: std_logic_vector(2 downto 0) := (others => '0');
   signal Asel, Bsel: std_logic_vector(2 downto 0) := (others => '0');
   signal DData: std_logic_vector(15 downto 0) := (others => '0');
 	--Outputs
   signal AData, BData : std_logic_vector(15 downto 0);
	
	-- Clock period definitions
   constant CLK_period: time := 10 ns;
 
BEGIN
   uut: register_file_v2 PORT MAP (
          load_enable => load_enable,
			 CLK => CLK,
          dest_select => dest_select,
          Asel => Asel,
          Bsel => Bsel,
          DData => DData,
          AData => AData,
          BData => BData
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
	
      wait for 10 ns;
		load_enable <= '1';
		DData <= "0000000000000011";
		dest_select <= "000";
		
		--set registers to unique values
		for i in 0 to 7 loop
			wait for CLK_period*2;
			dest_select <= STD_LOGIC_VECTOR (unsigned(dest_select) + 1);
			wait for CLK_period*2;
			DData <= STD_LOGIC_VECTOR (unsigned(DData) +16);
			wait for CLK_period*2;
		end loop;
		
		--read each register from A and B outputs
		Asel <= "000";
		Bsel <= "000";
		for i in 0 to 7 loop
			wait for CLK_period*3;
			Asel <= STD_LOGIC_VECTOR (unsigned(Asel) + 1);
			wait for CLK_period;
			Bsel <= STD_LOGIC_VECTOR (unsigned(Bsel) + 1);
		end loop;
		
      wait;
   end process;

END;

