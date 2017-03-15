import java.io.File;
import java.net.DatagramPacket;
//import java.net.DatagramSocket;
//import java.net.InetSocketAddress;
import java.util.Scanner;

import tcdIO.Terminal;

public class StopAndWait_Client extends Client{
	
	/**
	 * Constructor
	 * Attempts to create socket at given port and create an InetSocketAddress for the destinations
	 */
	StopAndWait_Client(Terminal terminal, String dstHost, int dstPort, int srcPort) {
		super(terminal, dstHost, dstPort, srcPort);
		maxSequenceNumber = 1;
	}

	
	/**
	 * Assume that incoming packets contain a String and print the string.
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
	 * Sender Method
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
	
	
	public static void main(String[] args) {
		try {
			Terminal terminal = new Terminal("Client");
			StopAndWait_Client thisClient = new StopAndWait_Client(terminal, DEFAULT_DST_NODE, DEFAULT_DST_PORT, DEFAULT_SRC_PORT);
			
			File file = new File(fileName);
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
