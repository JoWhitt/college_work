import java.net.DatagramPacket;

import tcdIO.Terminal;

public class GoBackN_Server extends Server{

	GoBackN_Server(Terminal terminal, int port) {
		super(terminal, port);
		maxSequenceNumber = 15;
	}
	
	public void onReceipt(DatagramPacket packet) {
		StringContent content = new StringContent(packet);
		
		if (content.packetNumber==expectedPacketNumber) {
			terminal.print(content.toString());
			terminal.print(" ");
			updateExpectedPacketNumber();
			sendAcknowledgement(packet, ACK_PACKET, expectedPacketNumber);
		}
		else {
			sendAcknowledgement(packet, NAK_PACKET, expectedPacketNumber);
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
			Terminal terminal = new Terminal("Go-back-N Server");
			(new GoBackN_Server(terminal, DEFAULT_PORT)).start();
			terminal.println("Program completed");
		} catch(java.lang.Exception e) {e.printStackTrace();}
	}

	
}
