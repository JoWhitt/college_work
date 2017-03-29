--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:04:38 03/22/2017
-- Design Name:   
-- Module Name:   U:/GitHub/college_work/Comp_Arch/datapath_tb.vhd
-- Project Name:  Project_1A
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: datapath
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
use ieee.numeric_std.all;

ENTITY datapath_tb IS
END datapath_tb;

ARCHITECTURE behavior OF datapath_tb IS 
    COMPONENT datapath
    PORT(	data_in, constant_in : in  STD_LOGIC_VECTOR (15 downto 0);
            dest_select, Aselect, Bselect : in  STD_LOGIC_VECTOR (2 downto 0);
            FSelect : in  STD_LOGIC_VECTOR (4 downto 0);
            load_enable, CLK, MBSelect, MDSelect : in  STD_LOGIC;
            data_out, address_out : out  STD_LOGIC_VECTOR (15 downto 0);
            V,C,N,Z : out  STD_LOGIC);
    END COMPONENT;
    
   --Inputs
   signal data_in, constant_in : std_logic_vector(15 downto 0) := (others => '0');
   signal dest_select, Aselect, Bselect : std_logic_vector(2 downto 0) := (others => '0');
   signal FSelect : std_logic_vector(4 downto 0) := (others => '0');
   signal load_enable, CLK, MBSelect, MDSelect : std_logic := '0';
 	--Outputs
   signal data_out, address_out : std_logic_vector(15 downto 0);
   signal V,C,N,Z : std_logic;

   constant CLK_period : time := 10 ns;
 
BEGIN
   uut: datapath PORT MAP (
          data_in => data_in,
          constant_in => constant_in,
          dest_select => dest_select,
          Aselect => Aselect,
          Bselect => Bselect,
          FSelect => FSelect,
          load_enable => load_enable,
          CLK => CLK,
          MBSelect => MBSelect,
          MDSelect => MDSelect,
          data_out => data_out,
          address_out => address_out,
          V => V,
          C => C,
          N => N,
          Z => Z
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
		
		--ALU TEST DESCRIPTION:
		-- This test loads the value "0000111100000000" into every register
		-- This value is read from register 4 into the function unit (through
		-- data line A. Each function is tested and the result stored into register 
		-- 5. The contents of register 4 can be read on address_out. When MBSelect is
		-- set to '1', register 5 can be read on data_out.
		
		--Set Registers
		MDSelect <= '1';
		data_in <= "0000111100000000";
		dest_select <= "000";
		load_enable <= '1';
		
		for i in 0 to 7 loop
			wait for CLK_period*2;
			dest_select <= STD_LOGIC_VECTOR (unsigned(dest_select) + 1);
		end loop;
		
		--Test ALU functionality as described above
		MBSelect <= '1';
		MDSelect <= '0';
		dest_select <= "101";
		Aselect <= "100";
		Bselect <= "101";
		constant_in <= "1111000000000000";

		MBSelect <= '1';
		load_enable <= '1';		wait for 10 ns;
		FSelect <= "00000";	-- A
		load_enable <= '0';
		MBSelect <= '0';	wait for 20 ns;

		MBSelect <= '1';
		load_enable <= '1';		wait for 10 ns;
		FSelect <= "00001";	-- A + 1
		load_enable <= '0';
		MBSelect <= '0';	wait for 20 ns;
		
		MBSelect <= '1';
		load_enable <= '1';		wait for 10 ns;
		FSelect <= "00011";	-- A + constant + 1
		load_enable <= '0';
		MBSelect <= '0';	wait for 20 ns;
				
		MBSelect <= '1';
		load_enable <= '1';		wait for 10 ns;
		FSelect <= "00110";	-- A - 1
		load_enable <= '0';
		MBSelect <= '0';	wait for 20 ns;	
		
		MBSelect <= '1';
		load_enable <= '1';		wait for 10 ns;
		FSelect <= "01000";	-- A and constant
		load_enable <= '0';
		MBSelect <= '0';	wait for 20 ns;
				
		MBSelect <= '1';
		load_enable <= '1';		wait for 10 ns;
		FSelect <= "01100";	-- A xor constant
		load_enable <= '0';
		MBSelect <= '0';	wait for 20 ns;

		MBSelect <= '1';
		load_enable <= '1';		wait for 10 ns;
		FSelect <= "01110";	-- not A
		load_enable <= '0';
		MBSelect <= '0';	wait for 20 ns;
		
		--SHIFT TEST DESCRIPTION:
		-- This test loads "0000000000000011" into register 4.
		-- This value is read from here into the function unit (through
		-- data line B. The value is shifted and stored back into register 2.  
		-- The contents of register 2 can be read on address_out.

		--Set Register 4
		load_enable <= '0';
		MDSelect <= '1';
		data_in <= "0000000000000011";
		dest_select <= "100";
		load_enable <= '1'; 	wait for 10 ns;
		
		load_enable <= '0';
		MDSelect <= '0';
		MBSelect <= '0';
		Aselect <= "010";
		Bselect <= "100";
		FSelect <= "11000";
	
		for i in 0 to 15 loop 
			load_enable <= '1'; 	wait for 10 ns;
			load_enable <= '0';	wait for 20 ns;
		end loop;
      wait;
   end process;

END;
