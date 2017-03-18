----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:38:43 03/14/2017 
-- Design Name: 
-- Module Name:    ripple_adder_16bit - Behavioral 
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

entity ripple_adder_16bit is
    Port ( Ain, Bin : in  STD_LOGIC_VECTOR (15 downto 0);
           A_in : in  STD_LOGIC; -- TODO: should this be C_in?
           C_out : out  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (15 downto 0));
end ripple_adder_16bit;

architecture Behavioral of ripple_adder_16bit is
-- COMPONENTS
	component full_adder is
		Port (  A: in  STD_LOGIC;
				  B: in  STD_LOGIC;
				  c_in: in  STD_LOGIC;
				  c_out: out  STD_LOGIC;
				  Sum: out  STD_LOGIC);
	end component;
	
-- SIGNALS
signal c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15: STD_LOGIC;

begin
-- PORT MAPS
	full0: full_adder port map (
		A => Ain(0),
		B => Bin(0),
		c_in => C_in,
		c_out => c1,
		Sum => Z(0)
	);
	
	full1: full_adder port map (
		A => Ain(1),
		B => Bin(1),
		c_in => c1,
		c_out => c2,
		Sum => Z(1)
	);
	
	full2: full_adder port map (
		A => Ain(2),
		B => Bin(2),
		c_in => c2,
		c_out => c3,
		Sum => Z(2)
	);
	
	full3: full_adder port map (
		A => Ain(3),
		B => Bin(3),
		c_in => c3,
		c_out => c4,
		Sum => Z(3)
	);
	
	full4: full_adder port map (
		A => Ain(4),
		B => Bin(4),
		c_in => c4,
		c_out => c5,
		Sum => Z(4)
	);
	
	full5: full_adder port map (
		A => Ain(5),
		B => Bin(5),
		c_in => c5,
		c_out => c6,
		Sum => Z(5)
	);
	
	full6: full_adder port map (
		A => Ain(6),
		B => Bin(6),
		c_in => c6,
		c_out => c7,
		Sum => Z(6)
	);
	
	full7: full_adder port map (
		A => Ain(7),
		B => Bin(7),
		c_in => c7,
		c_out => c8,
		Sum => Z(7)
	);
	
	full8: full_adder port map (
		A => Ain(8),
		B => Bin(8),
		c_in => c8,
		c_out => c9,
		Sum => Z(8)
	);
	
	full9: full_adder port map (
		A => Ain(9),
		B => Bin(9),
		c_in => c9,
		c_out => c10,
		Sum => Z(9)
	);
	
	full10: full_adder port map (
		A => Ain(10),
		B => Bin(10),
		c_in => c10,
		c_out => c11,
		Sum => Z(10)
	);
	
	full11: full_adder port map (
		A => Ain(11),
		B => Bin(11),
		c_in => c11,
		c_out => c12,
		Sum => Z(11)
	);
	
	full12: full_adder port map (
		A => Ain(12),
		B => Bin(12),
		c_in => c12,
		c_out => c13,
		Sum => Z(12)
	);
	
	full13: full_adder port map (
		A => Ain(13),
		B => Bin(13),
		c_in => c13,
		c_out => c14,
		Sum => Z(13)
	);
	
	full14: full_adder port map (
		A => Ain(14),
		B => Bin(14),
		c_in => c14,
		c_out => c15,
		Sum => Z(14)
	);
	
	full15: full_adder port map (
		A => Ain(15),
		B => Bin(15),
		c_in => c15,
		c_out => C_out,
		Sum => Z(15)
	);
	
end Behavioral;

