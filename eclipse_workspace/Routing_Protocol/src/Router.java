import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketAddress;

import tcdIO.Terminal;

public class Router extends Node{
	public static String LSR = "LSR";
	public static String DVR = "DVR";
	
	
	Router(Terminal terminal, int port, String router_type) {
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
	
	@Override
	public void onReceipt(DatagramPacket packet) {
		// TODO

		// check packet type?
		// if (DATA_TRANSFER_PACKET or ACK_/NAK_PACKET) { forwardPacket(packet); }
		// else { update routing table according to received data }
		
	}
	
	private void forwardPacket(DatagramPacket packet) {
		try {
			DatagramPacket forwardingPacket;
			StringContent packetContent;
			SocketAddress destinationAddress;
			
			packetContent = new StringContent(packet);
			
			
			forwardingPacket = packet; //replicate packet
			forwardingPacket.setSocketAddress(routingTable.getNextAddress(packetContent.toByteArray()[IP_INDEX])/*TODO: isolate destination address.*/);
			socket.send(forwardingPacket);
		}
		catch (Exception e) {e.printStackTrace();}
	}
	
}
