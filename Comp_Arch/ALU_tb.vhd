--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:59:27 03/21/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/ALU_tb.vhd
-- Project Name:  Project_1A
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: arithmetic_logic_unit
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
 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT arithmetic_logic_unit
    PORT(	dataA, dataB : IN  std_logic_vector(15 downto 0);
				FS_code : IN  std_logic_vector(4 downto 0);
				V, C_out : OUT  std_logic;
				dataG : OUT  std_logic_vector(15 downto 0) );
    END COMPONENT;
    

   --Inputs
   signal dataA : std_logic_vector(15 downto 0) := (others => '0');
   signal dataB : std_logic_vector(15 downto 0) := (others => '0');
   signal FS_code : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal V : std_logic;
   signal C_out : std_logic;
   signal dataG : std_logic_vector(15 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: arithmetic_logic_unit PORT MAP (
          dataA => dataA,
          dataB => dataB,
          FS_code => FS_code,
          V => V,
          C_out => C_out,
          dataG => dataG
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
      wait for 10 ns;	
		dataA <= "0000111100000000";
		dataB <= "0000000011110000";
		
		wait for 10 ns;	
		FS_code <= "00000";
		wait for 10 ns;	
		FS_code <= "00001";
		wait for 10 ns;	
		FS_code <= "00010";
		wait for 10 ns;	
		FS_code <= "00011";
		wait for 10 ns;	
		FS_code <= "00100";
		wait for 10 ns;	
		FS_code <= "00101";
		wait for 10 ns;	
		FS_code <= "00110";
		wait for 10 ns;	
		FS_code <= "00111";
		
		wait for 10 ns;
		FS_code <= "01000";
		wait for 10 ns;	
		FS_code <= "01010";
		wait for 10 ns;	
		FS_code <= "01100";
		wait for 10 ns;	
		FS_code <= "01110";		 

      wait;
   end process;

END;
