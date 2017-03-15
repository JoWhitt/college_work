import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.util.Random;

import tcdIO.Terminal;

public class StopAndWait_Server extends Server{


	
	StopAndWait_Server(Terminal terminal, int port) {
		super(terminal, port);
		maxSequenceNumber = 1;
	}

	/**
	 * Assume that incoming packets contain a String and print the string.
	 */
	public void onReceipt(DatagramPacket packet) {
		StringContent content = new StringContent(packet);
		if (content.packetType==expectedPacketType && content.packetNumber==expectedPacketNumber) {
			
			terminal.print(content.toString());
			terminal.print(" ");
			updateExpectedPacketNumber();
			sendAcknowledgement(packet, ACK_PACKET, expectedPacketNumber);
		}
		else {
			terminal.println("Wrong packet\nGot "+content.packetNumber+
					"instead of "+expectedPacketNumber+".");
		}			
	}
	
	
	
	public synchronized void start() throws Exception {
		terminal.println("Waiting for contact");
		while(!socket.isClosed())
			this.wait();
	}
	
	/*
	 * 
	 */
	public static void main(String[] args) {
		try {					
			Terminal terminal = new Terminal("Server");
			(new StopAndWait_Server(terminal, DEFAULT_PORT)).start();
			terminal.println("Program completed");
		} catch(java.lang.Exception e) {e.printStackTrace();}
	}

	
}
