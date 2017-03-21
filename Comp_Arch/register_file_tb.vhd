--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:11:54 02/23/2017
-- Design Name:   
-- Module Name:   U:/Comp_Arch/register_file_tb.vhd
-- Project Name:  Project_1A
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: register_file
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
 
ENTITY register_file_tb IS
END register_file_tb;
 
ARCHITECTURE behavior OF register_file_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_file
    PORT(
         src_s0, src_s1, src_s2: IN  std_logic;
         des_A0, des_A1, des_A2: IN  std_logic;
         CLK: IN  std_logic;
         data_src: IN  std_logic;
         data: IN  std_logic_vector(15 downto 0);
         reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7: out  STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;
    

   --Inputs
   signal src_s0: std_logic:= '0';
   signal src_s1: std_logic:= '0';
   signal src_s2: std_logic:= '0';
   signal des_A0: std_logic:= '0';
   signal des_A1: std_logic:= '0';
   signal des_A2: std_logic:= '0';
   signal CLK: std_logic:= '0';
   signal data_src: std_logic:= '0';
   signal data: std_logic_vector(15 downto 0):= (others => '0');

 	--Outputs
   signal reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7: STD_LOGIC_VECTOR (15 downto 0);

   -- Clock period definitions
   constant CLK_period: time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file PORT MAP (
		 src_s0 => src_s0,
		 src_s1 => src_s1,
		 src_s2 => src_s2,
		 des_A0 => des_A0,
		 des_A1 => des_A1,
		 des_A2 => des_A2,
		 CLK => CLK,
		 data_src => data_src,
		 data => data,
		 reg0 => reg0,
		 reg1 => reg1,
		 reg2 => reg2,
		 reg3 => reg3,
		 reg4 => reg4,
		 reg5 => reg5,
		 reg6 => reg6,
		 reg7 => reg7
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
      wait for 10 ns;	
		
		-- Q2(a) Loading straight into the registers
		src_S0<='0'; src_S1<='0'; src_S2<='0';
		data_src <= '0';
		data <= "0000000000000000";
		
		-- 0
		wait for CLK_period*3;
		des_A0<='0'; des_A1<='0'; des_A2<='0';
		
		-- 1
		wait for CLK_period*3;
		des_A0<='1'; des_A1<='0'; des_A2<='0';
		
		-- 2
		wait for CLK_period*3;
		des_A0<='0'; des_A1<='1'; des_A2<='0';
		
		-- 3
		wait for CLK_period*3;
		des_A0<='1'; des_A1<='1'; des_A2<='0';
		
		-- 4
		wait for CLK_period*3;
		des_A0<='0'; des_A1<='0'; des_A2<='1';
		
		-- 5
		wait for CLK_period*3;
		des_A0<='1'; des_A1<='0'; des_A2<='1';
		
		-- 6
		wait for CLK_period*3;
		des_A0<='0'; des_A1<='1'; des_A2<='1';
		
		-- 7
		wait for CLK_period*3;
		des_A0<='1'; des_A1<='1'; des_A2<='1';
		
		-- Q2(b) Loading from one register into the others
		wait for CLK_period*3;
		
		-- setup to read value from 0 
		des_A0<='0'; des_A1<='0'; des_A2<='0';
		data <= "1111111111111111";
		wait for CLK_period*3;
		data_src <= '1';
		
		-- 1
		wait for CLK_period*3;
		des_A0<='1'; des_A1<='0'; des_A2<='0';
		
		-- 2
		wait for CLK_period*3;
		des_A0<='0'; des_A1<='1'; des_A2<='0';
		
		-- 3
		wait for CLK_period*3;
		des_A0<='1'; des_A1<='1'; des_A2<='0';
		
		-- 4
		wait for CLK_period*3;
		des_A0<='0'; des_A1<='0'; des_A2<='1';
		
		-- 5
		wait for CLK_period*3;
		des_A0<='1'; des_A1<='0'; des_A2<='1';
		
		-- 6
		wait for CLK_period*3;
		des_A0<='0'; des_A1<='1'; des_A2<='1';
		
		-- 7
		wait for CLK_period*3;
		des_A0<='1'; des_A1<='1'; des_A2<='1';
		
		wait;
   end process;
END;
