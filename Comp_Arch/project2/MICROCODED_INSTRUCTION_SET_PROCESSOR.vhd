----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:16:29 04/07/2017 
-- Design Name: 
-- Module Name:    MICROCODED_INSTRUCTION_SET_PROCESSOR - Behavioral 
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

entity MICROCODED_INSTRUCTION_SET_PROCESSOR is
	port ( CLK: in std_logic );
end MICROCODED_INSTRUCTION_SET_PROCESSOR;

architecture Behavioral of MICROCODED_INSTRUCTION_SET_PROCESSOR is
-- COMPONENTS
	component microprogrammed_control is
    Port ( dataIn : in  STD_LOGIC_VECTOR (15 downto 0);
           V,C,N,S : in  STD_LOGIC;
           DR,SA,SB : out  STD_LOGIC_VECTOR (2 downto 0);
           PC : out  STD_LOGIC_VECTOR (15 downto 0);
           TD,TA,TB,MB,FS,MD,RW,MM,MW : out  STD_LOGIC);
	end component;
	
	component datapath is
    Port ( MM,MB,RW,FSel,MD : in  std_logic;
           SB : in  std_logic_vector (2 downto 0);
           DA, AA, BA : in  std_logic_vector (3 downto 0);
           DataIn, PC : in  std_logic_vector (15 downto 0);
           DataOut, AddressOut : out  std_logic_vector (15 downto 0);
           Vout,Cout,Nout,Zout : out  std_logic);
	end component;
	
	component memory512_16bit is
    Port ( DataIn, Address : in  STD_LOGIC_VECTOR (15 downto 0);
           MW, CLK : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
-- SIGNALS
signal	TDS,TAS,TBS,MBS,FSS,MDS,RWS,MMS,MWS,
			Vsig,Csig,Nsig,Ssig: STD_LOGIC;
signal	DRS,SAS,SBS : STD_LOGIC_VECTOR (2 downto 0);
signal	DAS,AAS,BAS : STD_LOGIC_VECTOR (3 downto 0);
signal	PCS,dataBus,DPDataOut,DPAddressOut : STD_LOGIC_VECTOR (15 downto 0);

begin
	microprogrammed_control: microprogrammed_control port map (
		dataIn => dataBus,
      V => Vsig,
		C => Csig,
		N => Nsig,
		S => Ssig,
      DR => DRS,
		SA => SAS,
		SB => SBS,
      PC => PCS,
      TD => TDS,
		TA => TAS,
		TB => TBS,
		MB => MBS,
		FS => FSS,
		MD => MDS,
		RW => RWS,
		MM => MMS,
		MW => MWS
	);
	
	datapath: datapath port map (
		MM => MMS,
		MB => MBS,
		RW => RWS,
		FSel => FSS,
		MD => MDS,
		SB => SBS,
      DA => DAS,
		AA => AAS,
		BA => BAS,
		DataIn => dataBus,
		PC => PCS,
		DataOut => DPDataOut,
		AddressOut => DPAddressOut,
		Vout => Vsig,
		Cout => Csig,
		Nout => Nsig,
		Zout => Zsig
	);
	
	memory: memory512_16bit PORT MAP (
          DataIn => DPDataOut,
          Address => DPAddressOut,
          MW => MWS,
          CLK => CLK,
          DataOut => dataBus
   );

end Behavioral;

