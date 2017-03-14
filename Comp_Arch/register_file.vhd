----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Joanna Whittam
-- 
-- Create Date:    19:09 02/23/2017 
-- Design Name: 
-- Module Name:    register_file - Behavioral 
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

entity register_file is
    Port ( src_s0, src_s1, src_s2: in  STD_LOGIC;
           des_A0, des_A1, des_A2: in  STD_LOGIC;
           CLK: in  STD_LOGIC;
           data_src: in  STD_LOGIC;
           data: in  STD_LOGIC_VECTOR (15 downto 0);
           reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7: out  STD_LOGIC_VECTOR (15 downto 0));
end register_file;

architecture Behavioral of register_file is
--COMPONENTS
	component decoder_3to8 is
   Port (  A0,A1,A2: in  STD_LOGIC;
           Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7: out  STD_LOGIC );
	end component;

	component mux2_4bit is
   Port (  S: in  STD_LOGIC;
           In0, In1: in  STD_LOGIC_VECTOR (15 downto 0);
           Z: out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	component mux8_16bit is
   Port (  S0,S1,S2: in STD_LOGIC;
           In0,In1,In2,In3,In4,In5,In6,In7: in STD_LOGIC_VECTOR (15 downto 0);
           Z: out STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	component reg
   Port (  D: in STD_LOGIC_VECTOR (15 downto 0);
           load, CLK: in STD_LOGIC;
           Q: out STD_LOGIC_VECTOR (15 downto 0) );
	end component;

--SIGNALS
	signal load_r0, load_r1, load_r2, load_r3, load_r4, load_r5, load_r6, load_r7: std_logic;
	signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q,
				data_src_mux_out, src_reg : std_logic_vector(15 downto 0);

begin 
--PORT MAPS	
	--Registers
	reg00: reg PORT MAP(
		D => data_src_mux_out,
		load => load_r0,
		Clk => Clk,
		Q => reg0_q
	);
	
	reg01: reg PORT MAP(
		D => data_src_mux_out,
		load => load_r1,
		Clk => Clk,
		Q => reg1_q
	);
	
	reg02: reg PORT MAP(
		D => data_src_mux_out,
		load => load_r2,
		Clk => Clk,
		Q => reg2_q
	);

	reg03: reg PORT MAP(
		D => data_src_mux_out,
		load => load_r3,
		Clk => Clk,
		Q => reg3_q
	);
	
	reg04: reg PORT MAP(
		D => data_src_mux_out,
		load => load_r4,
		Clk => Clk,
		Q => reg4_q
	);
	
	reg05: reg PORT MAP(
		D => data_src_mux_out,
		load => load_r5,
		Clk => Clk,
		Q => reg5_q
	);

	reg06: reg PORT MAP(
		D => data_src_mux_out,
		load => load_r6,
		Clk => Clk,
		Q => reg6_q
	);

	reg07: reg PORT MAP(
		D => data_src_mux_out,
		load => load_r7,
		Clk => Clk,
		Q => reg7_q
	);
	
	--Decoder
	decoder: decoder_3to8 PORT MAP(
		A0 => des_A0,
		A1 => des_A1,
		A2 => des_A2,
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
	data_src_mux2_4bit: mux2_4bit PORT MAP(
		S => data_src,
      In0 => data,
		In1 => src_reg,
      Z => data_src_mux_out
	);
	
	Inst_mux8_16bit: mux8_16bit PORT MAP(
		S0 => src_s0,
		S1 => src_s1,
		S2 => src_s2,
      In0 => reg0_q,
		In1 => reg1_q,
		In2 => reg2_q,
		In3 => reg3_q,
		In4 => reg4_q,
		In5 => reg5_q,
		In6 => reg6_q,
		In7 => reg7_q,
      Z => src_reg
	);
	
	reg0 <= reg0_q;
	reg1 <= reg1_q;
	reg2 <= reg2_q;
	reg3 <= reg3_q;
	reg4 <= reg4_q;
	reg5 <= reg5_q;
	reg6 <= reg6_q;
	reg7 <= reg7_q;
	
end Behavioral;

