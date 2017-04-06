----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:17:45 04/04/2017 
-- Design Name: 
-- Module Name:    register_file_64 - Behavioral 
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

entity register_file_64 is
    Port ( destAddress,srcAddress : in STD_LOGIC_VECTOR (5 downto 0);
			  dataIn : in STD_LOGIC_VECTOR (15 downto 0);
           load_enable, CLK : in STD_LOGIC;
           dataOut : out STD_LOGIC_VECTOR (15 downto 0));
end register_file_64;

architecture Behavioral of register_file_64 is
--COMPONENTS
	component decoder_3to8 is
   Port ( A0,A1,A2: in  STD_LOGIC;
          Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7: out  STD_LOGIC );
	end component;
	
	component register_file_8 is
    Port ( destAddress,srcAddress : in  STD_LOGIC_VECTOR (2 downto 0);
           DataIn : in  STD_LOGIC_VECTOR (15 downto 0);
           load_enable, CLK : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;

	component mux8_16bit is
   Port ( S0,S1,S2: in STD_LOGIC;
          In0,In1,In2,In3,In4,In5,In6,In7: in STD_LOGIC_VECTOR (15 downto 0);
          Z: out STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
--SIGNALS
signal decodeQ0,decodeQ1,decodeQ2,decodeQ3,decodeQ4,decodeQ5,decodeQ6,decodeQ7, 
		 load0,load1,load2,load3,load4,load5,load6,load7 : std_logic;
signal RFQ0,RFQ1,RFQ2,RFQ3,RFQ4,RFQ5,RFQ6,RFQ7 : STD_LOGIC_VECTOR (15 downto 0);

begin
--PORT DECLARATIONS
	decoder: decoder_3to8 PORT MAP (
		A0 => destAddress(3),
		A1 => destAddress(4),
		A2 => destAddress(5),
      Q0 => decodeQ0,
		Q1 => decodeQ1,
		Q2 => decodeQ2,
		Q3 => decodeQ3,
		Q4 => decodeQ4,
		Q5 => decodeQ5,
		Q6 => decodeQ6,
		Q7 => decodeQ7
	);
	
	load0 <= decodeQ0 and load_enable;
	load1 <= decodeQ1 and load_enable;
	load2 <= decodeQ2 and load_enable;
	load3 <= decodeQ3 and load_enable;
	load4 <= decodeQ4 and load_enable;
	load5 <= decodeQ5 and load_enable;
	load6 <= decodeQ6 and load_enable;
	load7 <= decodeQ7 and load_enable;

	--register_file_8's (8)
	reg_file0: register_file_8 PORT MAP (
		 destAddress => destAddress(2 downto 0),
		 srcAddress => srcAddress(2 downto 0),
		 DataIn => dataIn,
		 load_enable => load0,
		 CLK => CLK,
		 DataOut => RFQ0
   );
	
	reg_file1: register_file_8 PORT MAP (
		 destAddress => destAddress(2 downto 0),
		 srcAddress => srcAddress(2 downto 0),
		 DataIn => dataIn,
		 load_enable => load1,
		 CLK => CLK,
		 DataOut => RFQ1
   );
	
	reg_file2: register_file_8 PORT MAP (
		 destAddress => destAddress(2 downto 0),
		 srcAddress => srcAddress(2 downto 0),
		 DataIn => dataIn,
		 load_enable => load2,
		 CLK => CLK,
		 DataOut => RFQ2
   );
	
	reg_file3: register_file_8 PORT MAP (
		 destAddress => destAddress(2 downto 0),
		 srcAddress => srcAddress(2 downto 0),
		 DataIn => dataIn,
		 load_enable => load3,
		 CLK => CLK,
		 DataOut => RFQ3
   );
	
	reg_file4: register_file_8 PORT MAP (
		 destAddress => destAddress(2 downto 0),
		 srcAddress => srcAddress(2 downto 0),
		 DataIn => dataIn,
		 load_enable => load4,
		 CLK => CLK,
		 DataOut => RFQ4
   );
	
	reg_file5: register_file_8 PORT MAP (
		 destAddress => destAddress(2 downto 0),
		 srcAddress => srcAddress(2 downto 0),
		 DataIn => dataIn,
		 load_enable => load5,
		 CLK => CLK,
		 DataOut => RFQ5
   );
	
	reg_file6: register_file_8 PORT MAP (
		 destAddress => destAddress(2 downto 0),
		 srcAddress => srcAddress(2 downto 0),
		 DataIn => dataIn,
		 load_enable => load6,
		 CLK => CLK,
		 DataOut => RFQ6
   );
	
	reg_file7: register_file_8 PORT MAP (
		 destAddress => destAddress(2 downto 0),
		 srcAddress => srcAddress(2 downto 0),
		 DataIn => dataIn,
		 load_enable => load7,
		 CLK => CLK,
		 DataOut => RFQ7
   );

	mux: mux8_16bit PORT MAP (
		S0 => srcAddress(3),
		S1 => srcAddress(4),
		S2 => srcAddress(5),
      In0 => RFQ0,
		In1 => RFQ1,
		In2 => RFQ2,
		In3 => RFQ3,
		In4 => RFQ4,
		In5 => RFQ5,
		In6 => RFQ6,
		In7 => RFQ7,
      Z => DataOut
	);

end Behavioral;

