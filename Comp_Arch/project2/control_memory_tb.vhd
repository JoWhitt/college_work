--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:07:52 04/07/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/project2/control_memory_tb.vhd
-- Project Name:  Project_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: control_memory_256by28
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

ENTITY control_memory_tb IS
END control_memory_tb;
 
ARCHITECTURE behavior OF control_memory_tb IS 
 
    COMPONENT control_memory_256by28
    PORT ( IN_CAR : in  STD_LOGIC_VECTOR (7 downto 0);
           MW,MM,RW,MD : out  STD_LOGIC;
           FS : out  STD_LOGIC_VECTOR (4 downto 0);
           MB,TB,TA,TD,PL,PI,IL,MC : out STD_LOGIC;
           MS : out  STD_LOGIC_VECTOR (2 downto 0);
           NA : out  STD_LOGIC_VECTOR (7 downto 0));
    END COMPONENT;
    
   --Inputs
   signal IN_CAR : std_logic_vector(7 downto 0) := (others => '0');
 	--Outputs
   signal MW,MM,RW,MD : std_logic;
   signal FS : std_logic_vector(4 downto 0);
   signal MB,TB,TA,TD,PL,PI,IL,MC : std_logic;
   signal MS : std_logic_vector(2 downto 0);
   signal NA : std_logic_vector(7 downto 0);
 
BEGIN
   uut: control_memory_256by28 PORT MAP (
          IN_CAR => IN_CAR,
          MW => MW,
          MM => MM,
          RW => RW,
          MD => MD,
          FS => FS,
          MB => MB,
          TB => TB,
          TA => TA,
          TD => TD,
          PL => PL,
          PI => PI,
          IL => IL,
          MC => MC,
          MS => MS,
          NA => NA
   );
 
   stim_proc: process
   begin		
      wait for 100 ns;	
		IN_CAR <= "11111111";		wait for 10 ns;
		IN_CAR <= "11110000";		wait for 10 ns;
		IN_CAR <= "00001111";		wait for 10 ns;
		IN_CAR <= "00000001";		wait for 10 ns;
		IN_CAR <= "00000000";		wait for 10 ns;

      wait;
   end process;

END;
