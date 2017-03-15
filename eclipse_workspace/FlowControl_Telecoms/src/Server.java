import java.net.DatagramPacket;
import java.net.DatagramSocket;

import tcdIO.Terminal;

/*import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.util.Random;

import tcdIO.Terminal;*/

public abstract class Server extends Node {
	static final int DEFAULT_PORT = 50001;
	
	Server(Terminal terminal, int port) {
		try {
			expectedPacketNumber = 0;
			expectedPacketType = DATA_TRANSMIT_PACKET;
			
			this.terminal = terminal;
			socket = new DatagramSocket(port);
			listener.go();
		}
		catch(java.lang.Exception e) {e.printStackTrace();}
	}
	
	public void sendAcknowledgement(DatagramPacket packet, byte responseType, byte ACKNumber) {
		try {
			DatagramPacket response;
			response = (new StringContent("ACK", responseType, ACKNumber)).toDatagramPacket();
			response.setSocketAddress(packet.getSocketAddress());
			socket.send(response);
		}
		catch (Exception e) {e.printStackTrace();}
	}
}







