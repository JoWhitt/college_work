----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:46:47 03/07/2017 
-- Design Name: 
-- Module Name:    register_file_v2 - Behavioral 
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
entity register_file_v2 is
    Port ( load_enable, CLK: in  STD_LOGIC;
           dest_select_0, dest_select_1, dest_select_2 : in  STD_LOGIC;
           Asel0, Asel1, Asel2, Bsel0, Bsel1, Bsel2 : in  STD_LOGIC;
           DData : in  STD_LOGIC_VECTOR (15 downto 0);
           AData, BData : out  STD_LOGIC_VECTOR (15 downto 0));
end register_file_v2;

architecture Behavioral of register_file_v2 is
--COMPONENTS
	component decoder_3to8 is
   Port (  A0,A1,A2: in  STD_LOGIC;
           Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7: out  STD_LOGIC );
	end component;
	
	component reg
   Port (  D: in STD_LOGIC_VECTOR (15 downto 0);
           load, CLK: in STD_LOGIC;
           Q: out STD_LOGIC_VECTOR (15 downto 0) );
	end component;
	
	component mux8_16bit is
   Port (  S0,S1,S2: in STD_LOGIC;
           In0,In1,In2,In3,In4,In5,In6,In7: in STD_LOGIC_VECTOR (15 downto 0);
           Z: out STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
--SIGNALS
signal load_r0,load_r1,load_r2,load_r3,load_r4,load_r5,load_r6,load_r7: std_logic;
signal decode0_q,decode1_q,decode2_q,decode3_q,decode4_q,decode5_q,decode6_q,decode7_q: std_logic;
signal reg0_q,reg1_q,reg2_q,reg3_q,reg4_q,reg5_q,reg6_q,reg7_q: std_logic_vector(15 downto 0);

begin

load_r0 <= load_enable and decode0_q;
load_r1 <= load_enable and decode1_q;
load_r2 <= load_enable and decode2_q;
load_r3 <= load_enable and decode3_q;
load_r4 <= load_enable and decode4_q;
load_r5 <= load_enable and decode5_q;
load_r6 <= load_enable and decode6_q;
load_r7 <= load_enable and decode7_q;

--PORT MAPS	
	--Registers (8)
	reg00: reg PORT MAP(
		D => DData,
		load => load_r0,
		Clk => Clk,
		Q => reg0_q
	);
	
	reg01: reg PORT MAP(
		D => DData,
		load => load_r1,
		Clk => Clk,
		Q => reg1_q
	);
	
	reg02: reg PORT MAP(
		D => DData,
		load => load_r2,
		Clk => Clk,
		Q => reg2_q
	);

	reg03: reg PORT MAP(
		D => DData,
		load => load_r3,
		Clk => Clk,
		Q => reg3_q
	);
	
	reg04: reg PORT MAP(
		D => DData,
		load => load_r4,
		Clk => Clk,
		Q => reg4_q
	);
	
	reg05: reg PORT MAP(
		D => DData,
		load => load_r5,
		Clk => Clk,
		Q => reg5_q
	);

	reg06: reg PORT MAP(
		D => DData,
		load => load_r6,
		Clk => Clk,
		Q => reg6_q
	);

	reg07: reg PORT MAP(
		D => DData,
		load => load_r7,
		Clk => Clk,
		Q => reg7_q
	);
	
	--Decoder
	decoder: decoder_3to8 PORT MAP(
		A0 => dest_select_0,
		A1 => dest_select_1,
		A2 => dest_select_2,
      Q0 => load_r0,
		Q1 => load_r1,
		Q2 => load_r2,
		Q3 => load_r3,
		Q4 => load_r4,
		Q5 => load_r5,
		Q6 => load_r6,
		Q7 => load_r7
	);

	-- Multiplexers
	A_mux8_16bit: mux8_16bit PORT MAP(
		S0 => Asel0,
		S1 => Asel1,
		S2 => Asel2,
      In0 => reg0_q,
		In1 => reg1_q,
		In2 => reg2_q,
		In3 => reg3_q,
		In4 => reg4_q,
		In5 => reg5_q,
		In6 => reg6_q,
		In7 => reg7_q,
      Z => AData
	);

	B_mux8_16bit: mux8_16bit PORT MAP(
		S0 => Bsel0,
		S1 => Bsel1,
		S2 => Bsel2,
      In0 => reg0_q,
		In1 => reg1_q,
		In2 => reg2_q,
		In3 => reg3_q,
		In4 => reg4_q,
		In5 => reg5_q,
		In6 => reg6_q,
		In7 => reg7_q,
      Z => BData
	);

end Behavioral;

