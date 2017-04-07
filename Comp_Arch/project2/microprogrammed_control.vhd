----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:52:02 04/07/2017 
-- Design Name: 
-- Module Name:    microprogrammed_control - Behavioral 
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

entity microprogrammed_control is
    Port ( dataIn : in  STD_LOGIC_VECTOR (15 downto 0);
           V,C,N,S : in  STD_LOGIC;
           DR,SA,SB : out  STD_LOGIC_VECTOR (2 downto 0);
           PC : out  STD_LOGIC_VECTOR (15 downto 0);
           TD,TA,TB,MB,FS,MD,RW,MM,MW : out  STD_LOGIC);
end microprogrammed_control;

architecture Behavioral of microprogrammed_control is
--COMPONENTS
	COMPONENT control_memory_256by28
    PORT ( IN_CAR : in  STD_LOGIC_VECTOR (7 downto 0);
           MW,MM,RW,MD : out  STD_LOGIC;
           FS : out  STD_LOGIC_VECTOR (4 downto 0);
           MB,TB,TA,TD,PL,PI,IL,MC : out STD_LOGIC;
           MS : out  STD_LOGIC_VECTOR (2 downto 0);
           NA : out  STD_LOGIC_VECTOR (7 downto 0));
   END COMPONENT;
	 
	COMPONENT extend
    PORT(SR, DR : IN  STD_LOGIC_VECTOR(2 downto 0);
         extended : OUT  STD_LOGIC_VECTOR(15 downto 0)
        );
   END COMPONENT;
	 
	COMPONENT PC 
    PORT ( DR_SB_extended : in  STD_LOGIC_VECTOR (15 downto 0);
           PL,PI : in  STD_LOGIC;
			  PC : out  STD_LOGIC_VECTOR (15 downto 0));
	END COMPONENT;
	 
	COMPONENT opcode_generator
    PORT ( IL : in  STD_LOGIC;
           IR : in  STD_LOGIC_VECTOR (15 downto 0);
           opcode : out  STD_LOGIC_VECTOR (7 downto 0);
           DR, SA, SB : out  STD_LOGIC_VECTOR (2 downto 0));
   END COMPONENT;
	 
	COMPONENT mux2_8bit
    PORT ( S: in  STD_LOGIC;
           In0, In1: in  STD_LOGIC_VECTOR (7 downto 0);
           Z: out  STD_LOGIC_VECTOR (7 downto 0));
   END COMPONENT;
	
	COMPONENT mux8_1bit
    PORT ( in0,in1,in2,in3,in4,in5,in6,in7: in STD_LOGIC;
           s0,s1,s2: in STD_LOGIC;
           z: out STD_LOGIC);
	END COMPONENT;
	
	COMPONENT CAR
    PORT(	muxCOut : IN  std_logic_vector(7 downto 0);
				muxSOut : IN  std_logic;
				output : OUT  std_logic_vector(7 downto 0));
   END COMPONENT;
	 
--SIGNALS
signal	MWS,MMS,RWS,MDS,MBS,TBS,TAS,TDS,PLS,PIS,ILS,MCS,
			muxSOut : std_logic;
signal 	FSS : STD_LOGIC_VECTOR (4 downto 0);
signal 	MSS : STD_LOGIC_VECTOR (2 downto 0);
signal 	NAS,opcodeOut,muxCOut,CAROut : STD_LOGIC_VECTOR (7 downto 0);
signal 	extended : STD_LOGIC_VECTOR (15 downto 0);

begin
--PORT DECLARATIONS
	control_memory: control_memory_256by28 PORT MAP (
          IN_CAR => CAROut,
          MW => MWS,
          MM => MMS,
          RW => RWS,
          MD => MDS,
          FS => FSS,
          MB => MBS,
          TB => TBS,
          TA => TAS,
          TD => TDS,
          PL => PLS,
          PI => PIS,
          IL => ILS,
          MC => MCS,
          MS => MSS,
          NA => NAS
   );
	
	extend: extend PORT MAP (
          SR => SRS,
          DR => DRS,
          extended => extended
   );
	
	PC: PC PORT MAP (
			DR_SB_extended => extended,
			PL => PLS,
			PI => PIS,
			PC => PCS
	);
	
	opcode_gen: opcode_generator PORT MAP (
          IL => ILS,
          IR => dataIn,
          opcode => opcodeOut,
          DR => DRS,
          SA => SAS,
          SB => SBS
   );
	
	muxC: mux2_8bit PORT MAP (
          S => MCS,
          In0 => NAS,
          In1 => opcodeOut,
          Z => muxCOut
   );
	
	muxS: mux8_1bit PORT MAP (
			in0 => '0',
			in1 => '1',
			in2 => C,
			in3 => V,
			in4 => Z,
			in5 => N,
			in6 => (not C),
			in7 => (not V),
         s0 => MSS(0),
			s1 => MSS(1),
			s2 => MSS(2),
         z => muxSOut
	);
	
	CAR: CAR PORT MAP (
          muxCOut => muxCOut,
          muxSOut => muxSOut,
          output => CAROut
   );

	DR <= DRS;
	SA <= SAS;
	SB <= SBS;
	PC <= PCS;
	TD <= TDS;
	TA <= TAS;
	TB <= TBS;
	MB <= MBS;
	FS <= FSS;
	MD <= MDS;
	RW <= RWS;
	MM <= MMS;
	MW <= MWS;

end Behavioral;

