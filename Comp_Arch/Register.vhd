----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:31:30 02/14/2017 
-- Design Name: 
-- Module Name:    register - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg is
    Port ( D: in STD_LOGIC_VECTOR (15 downto 0);
           load, CLK: in STD_LOGIC;
           Q: out STD_LOGIC_VECTOR (15 downto 0) );
end reg;

architecture Behavioral of reg is

begin
	process(CLK)
	begin
		if (rising_edge(CLK)) then
			if load='1' then
				Q <= D after 5 ns;
			end if;
		end if;
	end process;
end Behavioral;

