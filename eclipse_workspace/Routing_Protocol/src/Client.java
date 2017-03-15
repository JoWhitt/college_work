
import java.net.DatagramSocket;
import java.net.InetSocketAddress;
import java.net.DatagramPacket;

import tcdIO.Terminal;

import java.io.File;
import java.util.Scanner;


/**
 * Client class
 * An instance accepts user input 
 */
public class Client extends Node {
	static final int DEFAULT_SRC_PORT = 50000;
	static final int DEFAULT_DST_PORT = 50001;
	static final String DEFAULT_DST_NODE = "localhost";	
	
	InetSocketAddress dstAddress;
	
	byte packetToSend;
	boolean receivedExpectedPacket = false;
	static String fileName = "text_to_send.txt";
	
	/**Constructor
	 * Attempts to create socket at given port and create an InetSocketAddress for the destinations
	 */
	Client(Terminal terminal, String dstHost, int dstPort, int srcPort) {
		try {
			packetToSend = 0;
			expectedPacketNumber = 1;
			expectedPacketType = ACK_PACKET;
			maxSequenceNumber = 1;
			
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

	
	/**Update the variable packetToSend
	 */
	public void updatePacketToSend() {
		packetToSend++;
		if (packetToSend>maxSequenceNumber)
			packetToSend=0;
	}

	/**Assume that incoming packets contain a String and print the string.
	 */
	public void onReceipt(DatagramPacket packet) {
		StringContent content = new StringContent(packet);
		
		if (content.packetNumber==expectedPacketNumber && content.packetType==ACK_PACKET) {
			terminal.println(content.toString());
			terminal.println("\n");
			receivedExpectedPacket = true;
			updateExpectedPacketNumber();
		}
		else {
			terminal.println("Incorrect packet received: "+content.packetNumber);
			terminal.println(content.toString());
		}
	}

	/**
	 * Stop&Wait sender Method
	 * 
	 */
	public synchronized void sendFile(File file) throws Exception {
		Scanner fileScanner = new Scanner(file);
		/* instead of using a delimiter as shown below, here a number of bytes could be
		 * read into a byte array instead. This would be easy to implement & easy to use
		 * the prepData() method with. */
		fileScanner.useDelimiter(" ");
        
        while(fileScanner.hasNext()) { //loop stays open till file is fully transmitted
			DatagramPacket packet = null;
			byte[] data = prepData(fileScanner.next());
			packet = new DatagramPacket(data, data.length, dstAddress);
			
			receivedExpectedPacket = false;
			while (!receivedExpectedPacket) {	//loop stays open till package successfully delivered & ACK received
				terminal.println("Sending packet "+packetToSend+".");
				socket.send(packet);
				this.wait(TIMEOUT);	
			}
			updatePacketToSend();
		}
        fileScanner.close();
        socket.close();
	}
	
	/**Stop&Wait main method.
	* Creates a Client terminal window.
	* Opens & sends file to Server(hardcoded).
	*/
	public static void main(String[] args) {
		try {
			Terminal terminal = new Terminal("Client");
			Client thisClient = new Client(terminal, DEFAULT_DST_NODE, DEFAULT_DST_PORT, DEFAULT_SRC_PORT);
			
			File file = new File(fileName);//filename needs to be read in as a parameter, not hardcoded
			if (file.exists()) {
				thisClient.sendFile(file);
				terminal.println("File sent successfully.");
	        }
			else {
				System.err.println("Could not open file " + fileName);
			}
		} 
		catch(java.lang.Exception e) {
			e.printStackTrace();
		}		
	}
	
}



