import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;
import java.util.concurrent.CountDownLatch;

import tcdIO.Terminal;


/** Superclass for CLient & Server nodes
* 
*/
public abstract class Node {
	static final int PACKETSIZE = 65536;
	
	//Indexs of particular data pieces within the byte[] data of a DatagramPacket
	static final int PACKET_TYPE_IDX = 0;
	static final int PACKET_NUMBER_IDX = 1;
	static final int IP_INDEX = 2;
	static final int IP_LENGTH = 4;
	
	//Packet types:
	static final byte ACK_PACKET = 0;
	static final byte NAK_PACKET = 1;
	static final byte DATA_TRANSMIT_PACKET = 2;
	
	static final int TIMEOUT = 300; //milliseconds 
	
	DatagramSocket socket;
	Listener listener;
	CountDownLatch latch;
	Terminal terminal;
	
	/* The number and type of the packet 
	* that the node expects next
	*/
	byte expectedPacketNumber;
	byte expectedPacketType;
	/* For Stop&Wait this is 1, since packets will be numbered 0 or 1
	* For GoBackN this is larger, eg 15
	*/
	int maxSequenceNumber;		
	
	
	Node() {
		latch= new CountDownLatch(1);
		listener= new Listener();
		listener.setDaemon(true);
		listener.start();
	}
	
	/** Imcrements expectedPacketNumber according to the maxSequenceNumber
	*/
	public void updateExpectedPacketNumber() {
		expectedPacketNumber++;
		if (expectedPacketNumber>maxSequenceNumber)
			expectedPacketNumber=0;
	}
	
	/** Implemented individually in each subclass.
	*/
	public abstract void onReceipt(DatagramPacket packet);
	
	//-------------------------------------------------------------------------
	
	/** Listener thread
	 * 
	 * Listens for incoming packets on a datagram socket and informs registered receivers 
	 * about incoming packets.
	 */
	class Listener extends Thread {
		
		/** Telling the listener that the socket has been initialised 
		 */
		public void go() {
			latch.countDown();
		}
		
		/** Listen for incoming packets and inform receivers
		 */
		public void run() {
			try {
				latch.await();
				// Endless loop: attempt to receive packet, notify receivers, etc
				while(true) {
					DatagramPacket packet = new DatagramPacket(new byte[PACKETSIZE], PACKETSIZE);
					socket.receive(packet);
					
					onReceipt(packet);
				}
			} catch (Exception e) {if (!(e instanceof SocketException)) e.printStackTrace();}
		}
	}
}