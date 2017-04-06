--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:15:34 04/05/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/project2/mux7_16bit_tb.vhd
-- Project Name:  Project_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux7_16bit
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
ENTITY mux7_16bit_tb IS
END mux7_16bit_tb;
 
ARCHITECTURE behavior OF mux7_16bit_tb IS 
    COMPONENT mux7_16bit
	 PORT ( S0,S1,S2: in STD_LOGIC;
           In0,In1,In2,In3,In4,In5,In6: in STD_LOGIC_VECTOR (15 downto 0);
           Z: out STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;
    
   --Inputs
   signal S0,S1,S2 : std_logic := '0';
   signal In0,In1,In2,In3,In4,In5,In6 : std_logic_vector(15 downto 0) := (others => '0');
 	--Outputs
   signal Z : std_logic_vector(15 downto 0);
 
BEGIN
   uut: mux7_16bit PORT MAP (
          S0 => S0,
          S1 => S1,
          S2 => S2,
          In0 => In0,
          In1 => In1,
          In2 => In2,
          In3 => In3,
          In4 => In4,
          In5 => In5,
          In6 => In6,
          Z => Z
        );
 
   stim_proc: process
   begin		
      In0 <= "0000000000000011";
		In1 <= "0000000000001100";
		In2 <= "0000000000110000";
		In3 <= "0000000011000000";
		In4 <= "0000001100000000";
		In5 <= "0000110000000000";
		In6 <= "0011000000000000";
      wait for 100 ns;	

		S0<='0'; S1<='0'; S2<='0';		wait for 10 ns;
		S0<='1'; S1<='0'; S2<='0';		wait for 10 ns;
		S0<='0'; S1<='1'; S2<='0';		wait for 10 ns;
		S0<='1'; S1<='1'; S2<='0';		wait for 10 ns;
		S0<='0'; S1<='0'; S2<='1';		wait for 10 ns;
		S0<='1'; S1<='0'; S2<='1';		wait for 10 ns;
		S0<='0'; S1<='1'; S2<='1';		wait;
   end process;
END;
