----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:34:59 03/22/2017 
-- Design Name: 
-- Module Name:    datapath - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity datapath is
    Port ( data_in, constant_in : in  STD_LOGIC_VECTOR (15 downto 0);
           dest_select, Aselect, Bselect : in  STD_LOGIC_VECTOR (2 downto 0);
           FSelect : in  STD_LOGIC_VECTOR (4 downto 0);
           load_enable, CLK, MBSelect, MDSelect : in  STD_LOGIC;
           data_out, address_out : out  STD_LOGIC_VECTOR (15 downto 0);
           V,C,N,Z : out  STD_LOGIC);
end datapath;

architecture Behavioral of datapath is
--COMPONENTS
	component register_file_v2 is
	port(  load_enable, CLK : in  STD_LOGIC;
          dest_select, Asel, Bsel : in  STD_LOGIC_VECTOR(2 downto 0);
          DData : in  STD_LOGIC_VECTOR (15 downto 0);
          AData, BData : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	component function_unit is
   port(  busA, busB : in  STD_LOGIC_VECTOR (15 downto 0);
          FSel : in  STD_LOGIC_VECTOR (4 downto 0);
          V, C, N, Z : out  STD_LOGIC;
          F : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	component mux2_16bit is 
	port(  S: in  STD_LOGIC;
          In0, In1: in  STD_LOGIC_VECTOR (15 downto 0);
          Z: out  STD_LOGIC_VECTOR (15 downto 0)
        );
   end component;
	
--SIGNALS
signal Bdata, FData, ABus, BBus, MuxDData: STD_LOGIC_VECTOR (15 downto 0);

begin
--PORT MAPS
	regFile: register_file_v2 port map (
		load_enable => load_enable,
		CLK => CLK,
		dest_select => dest_select,
		Asel => Aselect,
		Bsel => Bselect,
		DData => MuxDData,
		AData => ABus,
		BData => Bdata
	);
	
	functUnit: function_unit port map (
		busA => ABus,
		busB => BBus,
		FSel => FSelect,
		V => V,
		C => C,
		N => N,
		Z => Z,
		F => FData
	);
	
	muxB: mux2_16bit port map (
		S => MBSelect,
		In0 => Bdata,
		In1 => constant_in,
		Z => BBus
	);
	
	muxD: mux2_16bit port map (
		S => MDSelect,
		In0 => FData,
		In1 => data_in,
		Z => MuxDData
	);
	
	data_out <= BBus;
	address_out <= ABus;
	

end Behavioral;

