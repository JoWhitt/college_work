import java.net.DatagramPacket;
import java.util.Arrays;

public class StringContent {
	static final int PACKET_TYPE_IDX = 0;
	static final int PACKET_NUMBER_IDX = 1;
	static final byte ACK_PACKET = 0;
	static final byte NAK_PACKET = 1;
	static final byte DATA_TRANSMIT_PACKET = 2;
	
	String string;
	byte packetNumber;
	byte packetType;
	

//--------------------------------------------------------	
//CONSTRUCTORS
	
	public StringContent(DatagramPacket packet) {
		byte[] data;
		
		data = packet.getData();
		packetType = data[PACKET_TYPE_IDX];
		packetNumber = data[PACKET_NUMBER_IDX];

		/*
		// 	 |	Inefficient but it's not
		//	 |	a huge difference/problem
		//	 |	in my opinion.	TODO: consider solutions
		//	 V
		byte[] stringData = new byte[data.length-2];
		for (int i=0;  i<stringData.length; i++)
			stringData[i] = data[i+2]; 
		*/
		
		byte[] stringData = Arrays.copyOfRange(data, PACKET_NUMBER_IDX+1, data.length-1);
		string = new String(stringData);
	}
	
	public StringContent(String string, byte packetType, byte packetNumber) {
		this.string = string;
		this.packetType = packetType;
		this.packetNumber = packetNumber;
	}
//--------------------------------------------------------	
//METHODS
	
	public String toString() {
		return string;
	}
	
	public byte[] toByteArray() {
		char[] data = string.toCharArray();
		byte[] result = new byte[data.length+3]; //TODO: 3?
		
		result[] = ;
		
		for (int i=0; i<data.length; i++) {
			result[i+3] = (byte) data[i];
		}
		
		return result;
	}

	public DatagramPacket toDatagramPacket() { 
		DatagramPacket packet= null;
		try {
			byte[] stringData = string.getBytes(); //TODO: copy array including packet details at start
			byte[] allData = new byte[stringData.length+2];
			
			allData[PACKET_TYPE_IDX] = packetType;
			allData[PACKET_NUMBER_IDX] = packetNumber;
			for (int i=2; i<allData.length; i++) {
				allData[i] = stringData[i-2];
			}
			
			packet= new DatagramPacket(allData, allData.length);
		}
		catch(Exception e) {e.printStackTrace();}
		return packet;
	}
}