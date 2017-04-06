----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:36:23 04/06/2017 
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
entity datapath is
    Port ( MM,MB,RW,FSel,MD : in  std_logic;
           SB : in  std_logic_vector (2 downto 0);
           DA, AA, BA : in  std_logic_vector (3 downto 0);
           DataIn, PC : in  std_logic_vector (15 downto 0);
           DataOut, AddressOut : out  std_logic_vector (15 downto 0);
           Vout,Cout,Nout,Zout : out  std_logic);
end datapath;

architecture Behavioral of datapath is
--COMPONENTS
	COMPONENT register_file_9
    PORT(  load_enable, CLK : in  STD_LOGIC;
           DA,AA,BA: in STD_LOGIC_VECTOR(3 downto 0);
           DData : in  STD_LOGIC_VECTOR (15 downto 0);
           A,B : out  STD_LOGIC_VECTOR (15 downto 0));
   END COMPONENT;
	
	COMPONENT zero_fill
    PORT(	input : IN  std_logic_vector(2 downto 0);
				output : OUT  std_logic_vector(15 downto 0));
    END COMPONENT;
	 
	 COMPONENT mux2_16bit
    PORT(  S: in  STD_LOGIC;
           In0,In1: in  STD_LOGIC_VECTOR (15 downto 0);
           Z: out  STD_LOGIC_VECTOR (15 downto 0) );
    END COMPONENT;
	 
	 COMPONENT function_unit
    PORT ( busA,busB : in  STD_LOGIC_VECTOR (15 downto 0);
           FSel : in  STD_LOGIC_VECTOR (4 downto 0);
           Vflag,Cflag,Nflag,Zflag : out  STD_LOGIC;
           F : out  STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;
	
--SIGNALS
signal 	busA, busB, busD,
			zFillOut, RFBout, FUOut: std_logic_vector;
	
begin
--PORT DECLARATIONS
	reg_file: register_file_9 PORT MAP (
       load_enable => RW,
       CLK => CLK,
       DA => DA,
       AA => AA,
       BA => BA,
       DData => busD,
       A => busA,
       B => RFBout
   );
	
	zero_fill: zero_fill PORT MAP (
      input => SB,
      output => zFillOut
   );
	
	muxD: mux2_16bit PORT MAP (
      S => MD,
      In0 => FUOut,
      In1 =>  DataIn,
      Z => busD
   );

	muxB: mux2_16bit PORT MAP (
      S => MB,
      In0 => RFBout,
      In1 =>  zFillOut,
      Z => busB
   );
	
	muxM: mux2_16bit PORT MAP (
      S => MM,
      In0 => busA,
      In1 => PC,
      Z => AddressOut
   );
	
	uut: function_unit PORT MAP (
      busA => busA,
      busB => busB,
      FSel => FSel,
      Vflag => Vout,
      Cflag => Cout,
      Nflag => Nout,
      Zflag => Zout,
      F => FUOut
	);

end Behavioral;

