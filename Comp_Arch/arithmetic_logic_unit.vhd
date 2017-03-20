----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:31:35 03/20/2017 
-- Design Name: 
-- Module Name:    arithmetic_logic_unit - Behavioral 
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

entity arithmetic_logic_unit is
    Port ( dataA, dataB : in  STD_LOGIC_VECTOR (15 downto 0);
           FS_code : in  STD_LOGIC_VECTOR (4 downto 0);
		   --H_sel :  in  STD_LOGIC_VECTOR (1 downto 0);
		   --C_in : in  STD_LOGIC;
           --V, C_out : out  STD_LOGIC;
           dataG : out  STD_LOGIC_VECTOR (15 downto 0));
end arithmetic_logic_unit;

architecture Behavioral of arithmetic_logic_unit is

begin
	if ( FS_code(4 downto 3)='00') {
		if ( FS_code(2 downto 0)="000" ) {
			dataG <= dataA; }
		else if ( FS_code(2 downto 0)="001" ) {
			dataG <= dataA + '1'; }
		else if ( FS_code(2 downto 0)="010" ) {
			dataG <= dataA + dataB; }
		else if ( FS_code(2 downto 0)="011" ) {
			dataG <= dataA + dataB + '1'; }
		else if ( FS_code(2 downto 0)="100" ) {
			dataG <= dataA + (not dataB); }
		else if ( FS_code(2 downto 0)="101" ) {
			dataG <= dataA + (not dataB) + '1'; }
		else if ( FS_code(2 downto 0)="110" ) {
			dataG <= dataA - 1; }
		else {
			dataG <= dataA; }
	}
	else if ( FS_code(4 downto 3)='01') {
		if ( FS_code(2 downto 0)="000" ) {
			dataG <= dataA and dataB; }
		else if ( FS_code(2 downto 0)="010" ) {
			dataG <= dataA or dataB; }
		else if ( FS_code(2 downto 0)="100" ) {
			dataG <= dataA xor dataB; }
		else if ( FS_code(2 downto 0)="110" ) {
			dataG <= not dataA; }
	}
	else {
		if ( FS_code(3 downto 0)="0000" ) {
			dataG <= dataB; }
		else if ( FS_code(3 downto 0)="0100" ) {
			dataG <= dataB * 2; }
		else if ( FS_code(3 downto 0)="1000" ) {
			dataG <= dataB / 2; }
	}
end Behavioral;

