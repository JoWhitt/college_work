--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:36:00 04/06/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/project2/memory512_16bit_tb.vhd
-- Project Name:  Project_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: memory512_16bit
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
ENTITY memory512_16bit_tb IS
END memory512_16bit_tb;
 
ARCHITECTURE behavior OF memory512_16bit_tb IS 
 
    COMPONENT memory512_16bit
    PORT( DataIn, Address : in  STD_LOGIC_VECTOR (15 downto 0);
          MW, CLK : in  STD_LOGIC;
          DataOut : out  STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;
    
   --Inputs
   signal DataIn, Address : std_logic_vector(15 downto 0) := (others => '0');
   signal MW, CLK : std_logic := '0';
 	--Outputs
   signal DataOut : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
   uut: memory512_16bit PORT MAP (
          DataIn => DataIn,
          Address => Address,
          MW => MW,
          CLK => CLK,
          DataOut => DataOut
   );

   -- Clock process definitions
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
		MW <= '0';
		DataIn <= "0000000000000000";
		Address <= "0000000000000000";
		
		--load registers with their own addresses & read on DataOut
		--set 0
		MW <= '1';		wait for CLK_period*2;
		MW <= '0';		wait for CLK_period;

		--set 1 to 511
		for i in 0 to 510 loop
			MW <= '0';
			Address <= std_logic_vector (unsigned(Address) +1);
			DataIn  <= std_logic_vector (unsigned(DataIn) +1);
			Address <= std_logic_vector (unsigned(Address) +1);	wait for CLK_period;
			MW <= '1';															wait for CLK_period;
			MW <= '0';															wait for CLK_period;
		end loop;		
      wait;
   end process;

END;
