import java.io.File;
import java.io.FileNotFoundException;
import java.net.DatagramPacket;
import java.util.ArrayList;
//import java.net.DatagramSocket;
//import java.net.InetSocketAddress;
import java.util.Scanner;

import tcdIO.Terminal;



public class GoBackN_Client extends Client{

	int windowSize;
	int requestNumber;
	int sequenceBase;// = 0;
	int currentSequenceNumber;
	int sequenceMax;// = maxSequenceNumber;

	/**
	 * Constructor
	 * Attempts to create socket at given port and create an InetSocketAddress for the destinations
	 */
	GoBackN_Client(Terminal terminal, String dstHost, int dstPort, int srcPort) {
		super(terminal, dstHost, dstPort, srcPort);
		windowSize = 16;
		maxSequenceNumber = windowSize-1;
		sequenceMax = maxSequenceNumber;
		sequenceBase = 0;
		currentSequenceNumber = 0;
	}
	

	/**
	 * Assume that incoming packets contain a String and print the string.
	 */
	public void onReceipt(DatagramPacket packet) {
		StringContent content = new StringContent(packet);

		if (content.packetType==ACK_PACKET && content.packetNumber>sequenceBase) {
			sequenceMax += content.packetNumber - sequenceBase;
			sequenceBase = content.packetNumber;
		}
		else if (content.packetType==NAK_PACKET) {
			sequenceBase = content.packetNumber;
			currentSequenceNumber = sequenceBase;
			sequenceMax = sequenceBase+windowSize;
		}
	}


	/**
	 * Sender Method
	 * 
	 */
	public synchronized void sendFile(File file) throws Exception {
		
		ArrayList<String> words = readInFile(file);
		DatagramPacket[] packets = new DatagramPacket[words.size()];
		byte[] data;
		
		for (int i=0; i<words.size(); i++) {
			data = prepData(words.get(i));
			updatePacketToSend();
			packets[i] = new DatagramPacket(data, data.length, dstAddress);
		}
		
		
		while (sequenceMax<packets.length) {
			for (int j=0; j<=sequenceMax; j++) {
				terminal.println("Sending packet "+(j)+".");
				socket.send(packets[j]);
			}
			this.wait(100);
		}
	}
	
	
	public ArrayList<String> readInFile(File file){
		ArrayList<String> toReturn = new ArrayList<String>();

		try {
			Scanner fileScanner = new Scanner(file);
			fileScanner.useDelimiter(" ");
			while (fileScanner.hasNext()) {
				toReturn.add(fileScanner.next());
			}
			fileScanner.close();
		} 
		catch (FileNotFoundException e) { e.printStackTrace(); }
		return toReturn;
	}
	
	
	public static void main(String[] args) {
		try {
			Terminal terminal = new Terminal("Go-back-N Client");
			GoBackN_Client thisClient = new GoBackN_Client(terminal, DEFAULT_DST_NODE, DEFAULT_DST_PORT, DEFAULT_SRC_PORT);
			
			File file = new File(fileName);
			if (file.exists()) {
				thisClient.sendFile(file);
				terminal.println("File transmitted");
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
