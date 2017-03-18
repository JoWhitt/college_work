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
 
ENTITY register_file_v2_tb IS
END register_file_v2_tb;
 
ARCHITECTURE behavior OF register_file_v2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_file_v2
    PORT(  load_enable, CLK : in  STD_LOGIC;
           dest_select_0, dest_select_1, dest_select_2 : in  STD_LOGIC;
           Asel0, Asel1, Asel2, Bsel0, Bsel1, Bsel2 : in  STD_LOGIC;
           DData : in  STD_LOGIC_VECTOR (15 downto 0);
           AData, BData : out  STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;
    

   --Inputs
   signal load_enable: std_logic := '0';
	signal CLK: std_logic:= '0';
   signal dest_select_0, dest_select_1, dest_select_2: std_logic := '0';
   signal Asel0, Asel1, Asel2, Bsel0, Bsel1, Bsel2: std_logic := '0';
   signal DData: std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal AData, BData : std_logic_vector(15 downto 0);
	
	-- Clock period definitions
   constant CLK_period: time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file_v2 PORT MAP (
          load_enable => load_enable,
			 CLK => CLK,
          dest_select_0 => dest_select_0,
          dest_select_1 => dest_select_1,
          dest_select_2 => dest_select_2,
          Asel0 => Asel0,
          Asel1 => Asel1,
          Asel2 => Asel2,
          Bsel0 => Bsel0,
          Bsel1 => Bsel1,
          Bsel2 => Bsel2,
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
