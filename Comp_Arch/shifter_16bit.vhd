----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:41:15 03/14/2017 
-- Design Name: 
-- Module Name:    shifter_16bit - Behavioral 
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

entity shifter_16bit is
    Port ( input: in STD_LOGIC(15 to 0);
           sel0,sel1,sel2,sel3 : in  STD_LOGIC;
           y: out STD_LOGIC(15 to 0) );
end shifter_16bit;

architecture Behavioral of shifter_16bit is
--COMPONENTS
	component mux16_16bit is
	Port ( in0,in1,in2,in3,in4,in5,in6,in7,in8: in STD_LOGIC_VECTOR;
				in9,in10,in11,in12,in13,in14,in15: in STD_LOGIC_VECTOR;
			 s0,s1,s2,s3: in STD_LOGIC;
			 z: out STD_LOGIC_VECTOR );
	end component;
	
begin
-- PORT MAPS
	mux0: mux16_16bit port map (
		input(0) => input(0),
		input(1) => input(15),
		input(2) => input(14),
		input(3) => input(13),
		input(4) => input(12),
		input(5) => input(11),
		input(6) => input(10),
		input(7) => input(9),
		input(8) => input(8),
		input(9) => input(7),
		input(10) => input(6),
		input(11) => input(5),
		input(12) => input(4),
		input(13) => input(3),
		input(14) => input(2),
		input(15) => input(1),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(0)
	);
	
	mux1: mux16_16bit port map (
		input(0) => input(1),
		input(1) => input(0),
		input(2) => input(15),
		input(3) => input(14),
		input(4) => input(13),
		input(5) => input(12),
		input(6) => input(11),
		input(7) => input(10),
		input(8) => input(9),
		input(9) => input(8),
		input(10) => input(7),
		input(11) => input(6),
		input(12) => input(5),
		input(13) => input(4),
		input(14) => input(3),
		input(15) => input(2),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(1)
	);
	
	mux2: mux16_16bit port map (
		input(0) => input(2),
		input(1) => input(1),
		input(2) => input(0),
		input(3) => input(15),
		input(4) => input(14),
		input(5) => input(13),
		input(6) => input(12),
		input(7) => input(11),
		input(8) => input(10),
		input(9) => input(9),
		input(10) => input(8),
		input(11) => input(7),
		input(12) => input(6),
		input(13) => input(5),
		input(14) => input(4),
		input(15) => input(3),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(2)
	);
	
	mux3: mux16_16bit port map (
		input(0) => input(3),
		input(1) => input(2),
		input(2) => input(1),
		input(3) => input(0),
		input(4) => input(15),
		input(5) => input(14),
		input(6) => input(13),
		input(7) => input(12),
		input(8) => input(11),
		input(9) => input(10),
		input(10) => input(9),
		input(11) => input(8),
		input(12) => input(7),
		input(13) => input(6),
		input(14) => input(5),
		input(15) => input(4),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(2)
	);
	
	mux4: mux16_16bit port map (
		input(0) => input(4),
		input(1) => input(3),
		input(2) => input(2),
		input(3) => input(1),
		input(4) => input(0),
		input(5) => input(15),
		input(6) => input(14),
		input(7) => input(13),
		input(8) => input(12),
		input(9) => input(11),
		input(10) => input(10),
		input(11) => input(9),
		input(12) => input(8),
		input(13) => input(7),
		input(14) => input(6),
		input(15) => input(5),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(4)
	);
	
	mux5: mux16_16bit port map (
		input(0) => input(5),
		input(1) => input(4),
		input(2) => input(3),
		input(3) => input(2),
		input(4) => input(1),
		input(5) => input(0),
		input(6) => input(15),
		input(7) => input(14),
		input(8) => input(13),
		input(9) => input(12),
		input(10) => input(11),
		input(11) => input(10),
		input(12) => input(9),
		input(13) => input(8),
		input(14) => input(7),
		input(15) => input(6),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(5)
	);
	
	mux6: mux16_16bit port map (
		input(0) => input(6),
		input(1) => input(5),
		input(2) => input(4),
		input(3) => input(3),
		input(4) => input(2),
		input(5) => input(1),
		input(6) => input(0),
		input(7) => input(15),
		input(8) => input(14),
		input(9) => input(13),
		input(10) => input(21),
		input(11) => input(11),
		input(12) => input(10),
		input(13) => input(9),
		input(14) => input(8),
		input(15) => input(7),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(6)
	);
	
	mux7: mux16_16bit port map (
		input(0) => input(7),
		input(1) => input(6),
		input(2) => input(5),
		input(3) => input(4),
		input(4) => input(3),
		input(5) => input(2),
		input(6) => input(1),
		input(7) => input(0),
		input(8) => input(15),
		input(9) => input(14),
		input(10) => input(13),
		input(11) => input(12),
		input(12) => input(11),
		input(13) => input(10),
		input(14) => input(9),
		input(15) => input(8),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(7)
	);
	
	mux8: mux16_16bit port map (
		input(0) => input(8),
		input(1) => input(7),
		input(2) => input(6),
		input(3) => input(5),
		input(4) => input(4),
		input(5) => input(3),
		input(6) => input(2),
		input(7) => input(1),
		input(8) => input(0),
		input(9) => input(15),
		input(10) => input(14),
		input(11) => input(13),
		input(12) => input(12),
		input(13) => input(11),
		input(14) => input(10),
		input(15) => input(9),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(8)
	);
	
	mux9: mux16_16bit port map (
		input(0) => input(9),
		input(1) => input(8),
		input(2) => input(7),
		input(3) => input(6),
		input(4) => input(5),
		input(5) => input(4),
		input(6) => input(3),
		input(7) => input(2),
		input(8) => input(1),
		input(9) => input(0),
		input(10) => input(15),
		input(11) => input(14),
		input(12) => input(13),
		input(13) => input(12),
		input(14) => input(11),
		input(15) => input(10),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(9)
	);
	
	mux10: mux16_16bit port map (
		input(0) => input(10),
		input(1) => input(9),
		input(2) => input(8),
		input(3) => input(7),
		input(4) => input(6),
		input(5) => input(5),
		input(6) => input(4),
		input(7) => input(3),
		input(8) => input(2),
		input(9) => input(1),
		input(10) => input(0),
		input(11) => input(15),
		input(12) => input(14),
		input(13) => input(13),
		input(14) => input(12),
		input(15) => input(11),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(10)
	);
	
	mux11: mux16_16bit port map (
		input(0) => input(11),
		input(1) => input(10),
		input(2) => input(9),
		input(3) => input(8),
		input(4) => input(7),
		input(5) => input(6),
		input(6) => input(5),
		input(7) => input(4),
		input(8) => input(3),
		input(9) => input(2),
		input(10) => input(1),
		input(11) => input(0),
		input(12) => input(15),
		input(13) => input(14),
		input(14) => input(13),
		input(15) => input(12),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(11)
	);
	
	mux12: mux16_16bit port map (
		input(0) => input(12),
		input(1) => input(11),
		input(2) => input(10),
		input(3) => input(9),
		input(4) => input(8),
		input(5) => input(7),
		input(6) => input(6),
		input(7) => input(5),
		input(8) => input(4),
		input(9) => input(3),
		input(10) => input(2),
		input(11) => input(1),
		input(12) => input(0),
		input(13) => input(15),
		input(14) => input(14),
		input(15) => input(13),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(12)
	);
	mux13: mux16_16bit port map (
		input(0) => input(13),
		input(1) => input(12),
		input(2) => input(11),
		input(3) => input(10),
		input(4) => input(9),
		input(5) => input(8),
		input(6) => input(7),
		input(7) => input(6),
		input(8) => input(5),
		input(9) => input(4),
		input(10) => input(3),
		input(11) => input(2),
		input(12) => input(1),
		input(13) => input(0),
		input(14) => input(15),
		input(15) => input(14),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(13)
	);
	
	mux14: mux16_16bit port map (
		input(0) => input(14),
		input(1) => input(13),
		input(2) => input(12),
		input(3) => input(11),
		input(4) => input(10),
		input(5) => input(9),
		input(6) => input(8),
		input(7) => input(7),
		input(8) => input(6),
		input(9) => input(5),
		input(10) => input(4),
		input(11) => input(3),
		input(12) => input(2),
		input(13) => input(1),
		input(14) => input(0),
		input(15) => input(15),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(14)
	);
	
	mux15: mux16_16bit port map (
		input(0) => input(15),
		input(1) => input(14),
		input(2) => input(13),
		input(3) => input(12),
		input(4) => input(11),
		input(5) => input(10),
		input(6) => input(9),
		input(7) => input(8),
		input(8) => input(7),
		input(9) => input(6),
		input(10) => input(5),
		input(11) => input(4),
		input(12) => input(3),
		input(13) => input(2),
		input(14) => input(1),
		input(15) => input(0),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(15)
	);
end Behavioral;

