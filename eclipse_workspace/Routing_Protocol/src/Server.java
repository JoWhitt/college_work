import java.net.DatagramPacket;
import java.net.DatagramSocket;

import java.util.Random;

import tcdIO.Terminal;

public class Server extends Node {
	static final int DEFAULT_PORT = 50001;
	
	Server(Terminal terminal, int port) {
		try {
			expectedPacketNumber = 0;
			expectedPacketType = DATA_TRANSMIT_PACKET;
			maxSequenceNumber = 1;
			
			this.terminal = terminal;
			socket = new DatagramSocket(port);
			listener.go();
		}
		catch(java.lang.Exception e) {e.printStackTrace();}
	}
	
	/** Send ACK_PACKET to Client
	* Socket address for the packet is set to the socket address for the received packet.
	* 
	* @param: 	packet = the received packet to be acknowledged
	*			responseType = either ACK_PACKET or NAK_PACKET according to flow control protocol
	*			ACKNumber = the number of the packet that the Server expects next
	*/ 
	public void sendAcknowledgement(DatagramPacket packet, byte responseType, byte ACKNumber) {
		try {
			DatagramPacket response;
			response = (new StringContent("ACK", responseType, ACKNumber)).toDatagramPacket();
			response.setSocketAddress(packet.getSocketAddress());
			socket.send(response);
		}
		catch (Exception e) {e.printStackTrace();}
	}

	/** Check that received packets have the expected packet number.
	* If number is incorrect disregard packet.
	* 
	* Otherwise assume that incoming packets contain a String and print it to the terminal
	* Send ACK_PACKET to client & update the expected packet number.
	* 
	* @param:	packet = the received packet
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
		
	/**	Waits to receive packets until the socket is closed.
	*/
	public synchronized void start() throws Exception {
		terminal.println("Waiting for contact");
		while(!socket.isClosed())
			this.wait();
	}
	
	/** Stop&Wait main function
	 * Creates new terminal window
	 * Opens port & waits to receive packets (starting with packet number 0)
	 * Prints received data to terminal
	 * Acknowledges received packets
	 */
	public static void main(String[] args) {
		try {					
			Terminal terminal = new Terminal("Server");
			(new Server(terminal, DEFAULT_PORT)).start();
			terminal.println("Program completed");
		} catch(java.lang.Exception e) {e.printStackTrace();}
	}
}
