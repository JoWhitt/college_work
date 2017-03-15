/*import java.net.DatagramSocket;
import java.net.DatagramPacket;
import java.util.Scanner;
import java.net.*;
import java.io.*;
import tcdIO.*;*/

import java.net.DatagramSocket;
import java.net.InetSocketAddress;

import tcdIO.Terminal;

/**
 * Client class
 * An instance accepts user input 
 */
public abstract class Client extends Node {
	static final int DEFAULT_SRC_PORT = 50000;
	static final int DEFAULT_DST_PORT = 50001;
	static final String DEFAULT_DST_NODE = "localhost";	
	
	InetSocketAddress dstAddress;
	
	byte packetToSend;
	boolean receivedExpectedPacket = false;
	static String fileName = "text_to_send.txt";
	
	Client(Terminal terminal, String dstHost, int dstPort, int srcPort) {
		try {
			packetToSend = 0;
			expectedPacketNumber = 1;
			expectedPacketType = ACK_PACKET;
			
			this.terminal = terminal;
			dstAddress = new InetSocketAddress(dstHost, dstPort);
			socket = new DatagramSocket(srcPort);
			listener.go();
		}
		catch(java.lang.Exception e) {e.printStackTrace();}
	}
	
	/** Given a string to transmit, this function creates byte array to send to 
	 * the Server. It gives the byte a packet number according to the packetToSend 
	 * variable and a packet type of DATA_TRANSMIT_PACKET(which is global variable 
	 * associated with Node).  
	 * 
	 * The returned byte is intended to be passed into the DatagramPacket constructor.
	 * 
	 * @param word:
	 * @return dataAndInfo:
	 */
	public byte[] prepData(String word){
		byte[] data = null;
		data = word.getBytes();

		byte[] dataAndInfo = new byte[data.length+2];
		
		//set packetType & packetNumber
		dataAndInfo[PACKET_TYPE_IDX] = DATA_TRANSMIT_PACKET;
		dataAndInfo[PACKET_NUMBER_IDX] = packetToSend;
		
		for(int i=2; i<dataAndInfo.length; i++)
			dataAndInfo[i] = data[i-2];
		return dataAndInfo;
	}

	
	/**
	 * Update the variable packetToSend
	 * 
	 */
	public void updatePacketToSend() {
		packetToSend++;
		if (packetToSend>maxSequenceNumber)
			packetToSend=0;
	}

	
}














