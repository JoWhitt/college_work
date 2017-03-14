--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:29:18 02/23/2017
-- Design Name:   
-- Module Name:   U:/Comp_Arch/reg_tb.vhd
-- Project Name:  Project_1A
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY reg_tb IS
END reg_tb;
 
ARCHITECTURE behavior OF reg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg
    PORT( D: IN  std_logic_vector(15 downto 0);
          load, CLK: IN  std_logic;
          Q: OUT  std_logic_vector(15 downto 0) );
    END COMPONENT;
    

   --Inputs
   signal D: std_logic_vector(15 downto 0) := (others => '0');
   signal load: std_logic := '0';
   signal CLK: std_logic := '0';

 	--Outputs
   signal Q: std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period: time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg PORT MAP (
          D => D,
          load => load,
          CLK => CLK,
          Q => Q
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
      -- hold reset state for 50 ns.
      wait for 5 ns;	
		
		D <= "0000000000001111";
		wait for CLK_period*20;
		load <= '1';
		wait for CLK_period*20;
		load <= '0';
		
		D <= "0000000011110000";
		wait for CLK_period*20;
		load <= '1';
		wait for CLK_period*20;
		load <= '0';
		
		D <= "0000111100000000";
		wait for CLK_period*20;
		load <= '1';
		wait for CLK_period*20;
		load <= '0';
		
		D <= "1111000000000000";
		wait for CLK_period*20;
		load <= '1';
		wait for CLK_period*20;
		load <= '0';
      wait;
   end process;

END;
