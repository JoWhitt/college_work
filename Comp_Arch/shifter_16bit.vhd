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
    Port ( input: in STD_LOGIC_VECTOR(15 to 0);
           sel0,sel1,sel2,sel3 : in  STD_LOGIC;
           y: out STD_LOGIC_VECTOR(15 to 0) );
end shifter_16bit;

architecture Behavioral of shifter_16bit is
--COMPONENTS
	component mux16_1bit is
	Port ( in0,in1,in2,in3,in4,in5,in6,in7,in8: in STD_LOGIC;
				in9,in10,in11,in12,in13,in14,in15: in STD_LOGIC;
			 s0,s1,s2,s3: in STD_LOGIC;
			 z: out STD_LOGIC );
	end component;

begin
-- PORT MAPS
	mux0: mux16_1bit port map (
		in0 => input(0),
		in1 => input(15),
		in2 => input(14),
		in3 => input(13),
		in4 => input(12),
		in5 => input(11),
		in6 => input(10),
		in7 => input(9),
		in8 => input(8),
		in9 => input(7),
		in10 => input(6),
		in11 => input(5),
		in12 => input(4),
		in13 => input(3),
		in14 => input(2),
		in15 => input(1),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(0)
	);
	
	mux1: mux16_1bit port map (
		in0 => input(1),
		in1 => input(0),
		in2 => input(15),
		in3 => input(14),
		in4 => input(13),
		in5 => input(12),
		in6 => input(11),
		in7 => input(10),
		in8 => input(9),
		in9 => input(8),
		in10 => input(7),
		in11 => input(6),
		in12 => input(5),
		in13 => input(4),
		in14 => input(3),
		in15 => input(2),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(1)
	);
	
	mux2: mux16_1bit port map (
		in0 => input(2),
		in1 => input(1),
		in2 => input(0),
		in3 => input(15),
		in4 => input(14),
		in5 => input(13),
		in6 => input(12),
		in7 => input(11),
		in8 => input(10),
		in9 => input(9),
		in10 => input(8),
		in11 => input(7),
		in12 => input(6),
		in13 => input(5),
		in14 => input(4),
		in15 => input(3),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(2)
	);
	
	mux3: mux16_1bit port map (
		in0 => input(3),
		in1 => input(2),
		in2 => input(1),
		in3=> input(0),
		in4 => input(15),
		in5 => input(14),
		in6 => input(13),
		in7 => input(12),
		in8 => input(11),
		in9 => input(10),
		in10 => input(9),
		in11 => input(8),
		in12 => input(7),
		in13 => input(6),
		in14 => input(5),
		in15 => input(4),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(2)
	);
	
	mux4: mux16_1bit port map (
		in0 => input(4),
		in1 => input(3),
		in2 => input(2),
		in3 => input(1),
		in4 => input(0),
		in5 => input(15),
		in6 => input(14),
		in7 => input(13),
		in8 => input(12),
		in9 => input(11),
		in10 => input(10),
		in11 => input(9),
		in12 => input(8),
		in13 => input(7),
		in14 => input(6),
		in15 => input(5),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(4)
	);
	
	mux5: mux16_1bit port map (
		in0 => input(5),
		in1 => input(4),
		in2 => input(3),
		in3 => input(2),
		in4 => input(1),
		in5 => input(0),
		in6 => input(15),
		in7 => input(14),
		in8 => input(13),
		in9 => input(12),
		in10 => input(11),
		in11 => input(10),
		in12 => input(9),
		in13 => input(8),
		in14 => input(7),
		in15 => input(6),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(5)
	);
	
	mux6: mux16_1bit port map (
		in0 => input(6),
		in1 => input(5),
		in2 => input(4),
		in3 => input(3),
		in4 => input(2),
		in5 => input(1),
		in6 => input(0),
		in7 => input(15),
		in8 => input(14),
		in9 => input(13),
		in10 => input(21),
		in11 => input(11),
		in12 => input(10),
		in13 => input(9),
		in14 => input(8),
		in15 => input(7),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(6)
	);
	
	mux7: mux16_1bit port map (
		in0 => input(7),
		in1 => input(6),
		in2 => input(5),
		in3 => input(4),
		in4 => input(3),
		in5 => input(2),
		in6 => input(1),
		in7 => input(0),
		in8 => input(15),
		in9 => input(14),
		in10 => input(13),
		in11 => input(12),
		in12 => input(11),
		in13 => input(10),
		in14 => input(9),
		in15 => input(8),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(7)
	);
	
	mux8: mux16_1bit port map (
		in0 => input(8),
		in1 => input(7),
		in2 => input(6),
		in3 => input(5),
		in4 => input(4),
		in5 => input(3),
		in6 => input(2),
		in7 => input(1),
		in8 => input(0),
		in9 => input(15),
		in10 => input(14),
		in11 => input(13),
		in12 => input(12),
		in13 => input(11),
		in14 => input(10),
		in15 => input(9),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(8)
	);
	
	mux9: mux16_1bit port map (
		in0 => input(9),
		in1 => input(8),
		in2 => input(7),
		in3 => input(6),
		in4 => input(5),
		in5 => input(4),
		in6 => input(3),
		in7 => input(2),
		in8 => input(1),
		in9 => input(0),
		in10=> input(15),
		in11 => input(14),
		in12 => input(13),
		in13 => input(12),
		in14 => input(11),
		in15 => input(10),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(9)
	);
	
	mux10: mux16_1bit port map (
		in0 => input(10),
		in1 => input(9),
		in2 => input(8),
		in3 => input(7),
		in4 => input(6),
		in5 => input(5),
		in6 => input(4),
		in7 => input(3),
		in8 => input(2),
		in9 => input(1),
		in10 => input(0),
		in11 => input(15),
		in12 => input(14),
		in13 => input(13),
		in14 => input(12),
		in15 => input(11),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(10)
	);
	
	mux11: mux16_1bit port map (
		in0 => input(11),
		in1 => input(10),
		in2 => input(9),
		in3 => input(8),
		in4 => input(7),
		in5 => input(6),
		in6 => input(5),
		in7 => input(4),
		in8 => input(3),
		in9 => input(2),
		in10 => input(1),
		in11 => input(0),
		in12 => input(15),
		in13 => input(14),
		in14 => input(13),
		in15 => input(12),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(11)
	);
	
	mux12: mux16_1bit port map (
		in0 => input(12),
		in1 => input(11),
		in2 => input(10),
		in3 => input(9),
		in4 => input(8),
		in5 => input(7),
		in6 => input(6),
		in7 => input(5),
		in8 => input(4),
		in9 => input(3),
		in10 => input(2),
		in11 => input(1),
		in12 => input(0),
		in13 => input(15),
		in14 => input(14),
		in15 => input(13),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(12)
	);
	mux13: mux16_1bit port map (
		in0 => input(13),
		in1 => input(12),
		in2 => input(11),
		in3 => input(10),
		in4 => input(9),
		in5 => input(8),
		in6 => input(7),
		in7 => input(6),
		in8 => input(5),
		in9 => input(4),
		in10 => input(3),
		in11 => input(2),
		in12 => input(1),
		in13 => input(0),
		in14 => input(15),
		in15 => input(14),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(13)
	);
	
	mux14: mux16_1bit port map (
		in0 => input(14),
		in1 => input(13),
		in2 => input(12),
		in3 => input(11),
		in4 => input(10),
		in5 => input(9),
		in6 => input(8),
		in7 => input(7),
		in8 => input(6),
		in9 => input(5),
		in10 => input(4),
		in11 => input(3),
		in12 => input(2),
		in13 => input(1),
		in14 => input(0),
		in15 => input(15),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(14)
	);
	
	mux15: mux16_1bit port map (
		in0 => input(15),
		in1 => input(14),
		in2 => input(13),
		in3 => input(12),
		in4 => input(11),
		in5 => input(10),
		in6 => input(9),
		in7 => input(8),
		in8 => input(7),
		in9 => input(6),
		in10 => input(5),
		in11 => input(4),
		in12 => input(3),
		in13 => input(2),
		in14 => input(1),
		in15 => input(0),
		s0 => sel0,
		s1 => sel1,
		s2 => sel2,
		s3 => sel3,
		z => y(15)
	);
end Behavioral;

