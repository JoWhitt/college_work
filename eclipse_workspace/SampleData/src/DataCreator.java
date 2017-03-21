import java.util.Scanner;
import java.util.Random;

/**
 * Build a data set and store into 2 .csv files
 * Nodes & edges are needed
 * 
 *
 */
public class DataCreator {

	
	private static int getNumber(Scanner input, String question) {
		System.out.println(question);
		
		while (true) {
			if (input.hasNextInt()) {
				return input.nextInt();
			}
		}
	}
	
	private static String[] createNodes(int n_nodes) {
		String nodes[] = new String[n_nodes];
		
		for (int i=0; i<nodes.length; i++) {
			nodes[i] = "s" + (i+1);
		}
		
		return nodes;
	}
	
	//Doesn't protect against edges from a node to itself, or repeated edges.
	//only creates int weights (not double)
	private static String[][] createEdges(int n_edges, int  min_weight, int max_weight, String nodes[]) {
		Random rand_gen = new Random();
		String edges[][] = new String[3][n_edges];
		
		for (int i=0; i<edges[0].length; i++) {
			edges[0][i] = nodes[ rand_gen.nextInt(nodes.length) ]; //"from"
			edges[1][i] = nodes[ rand_gen.nextInt(nodes.length) ]; //"to"
			edges[2][i] = "" + ( rand_gen.nextInt( max_weight - min_weight + 1) + min_weight ); //weight
		}
		
		return edges;
	}
	
	public static void main(String args0[]) {
		Scanner input = new Scanner(System.in);
		int n_nodes = getNumber(input, "How many nodes do you want?");
		int n_edges = getNumber(input, "How many edges do you want?");
		int min_weight = getNumber(input, "What min weight do you want the edges to have?");
		int max_weight = getNumber(input, "What max weight do you want the edges to have?");
		
		String nodes[] = createNodes(n_nodes);
		String edges[][] = createEdges(n_edges, min_weight, max_weight, nodes);
		
	}
	
}
