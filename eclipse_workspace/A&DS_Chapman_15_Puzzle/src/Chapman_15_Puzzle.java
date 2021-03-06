import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

public class Chapman_15_Puzzle {
	private static final int BOARD_SIZE = 4;
	public static final String BL = "  ";
	public static final String SOLVED_BOARD[][] = { 	{"01", "02", "03", "04"}, 
														{"05", "06", "07", "08"}, 
														{"09", "10", "11", "12"}, 
														{"13", "14", "15", BL} };
	
	public static final String RIGHT = "d";
	public static final String LEFT = "a";
	public static final String UP = "w";
	public static final String DOWN = "s";
	
//messages for printing to console 	
	public static final String INSTRUCTIONS = 
		"Type \""+RIGHT+"\" to move the space right, \""+LEFT+"\" for left, \n\""+UP+"\" for up and \""+
		DOWN+"\" for down.";
	public static final String INITIAL_INSTRUCTIONS =
		"Reorder the tiles by moving the blank space (BL) horizontally \n" 
		+ "and vertically around the board. \n" + INSTRUCTIONS;
	public static final String BAD_INSTRUCTION_MESSAGE = 
		"That's not a valid move.\n" + INSTRUCTIONS;
	public static final String SOLVEABLE_MESSAGE =
		"This puzzle's fully solveable! Can you get it?";
	public static final String UNSOLVEABLE_MESSAGE =
		"This puzzle's not solveable but let's see how close you can get!";
	
	String board[][];
	int BLRow, BLCol;	//coordinates for the blank space
	
	public Chapman_15_Puzzle() {
		//Initialise board to be equal to the solved board
		this.board = new String[BOARD_SIZE][BOARD_SIZE];
		for (int i=0; i<BOARD_SIZE; i++) {
			for (int j=0; j<BOARD_SIZE; j++) {
				this.board[i][j] = SOLVED_BOARD[i][j];
			}
		}
		
		System.out.println("New Board:\n");
		shuffle();
		printBoard();
		System.out.println(INSTRUCTIONS + "\n");
	}
	
	//find coordinates of the blank space after the board has been shuffled
	private void locateBL() {
		boolean found = false;
		for (int i=0; i<BOARD_SIZE && !found; i++) {
			for (int j=0; j<BOARD_SIZE && !found; j++) {
				if (board[i][j].equals(BL)) {
					BLRow = i;
					BLCol = j;
				}
			}
		}
	}
	
	//shuffles the board pieces
	public void shuffle() {
		Random rand = new Random();
		String tmp;
		int i2, j2;
		
		//Randomly swap each board space with another.
		for (int i=0; i<BOARD_SIZE; i++) {
			for (int j=0; j<BOARD_SIZE; j++) {
				i2 = rand.nextInt(BOARD_SIZE);
				j2 = rand.nextInt(BOARD_SIZE);
				tmp = board[i2][j2];
				board[i2][j2] = board[i][j];
				board[i][j] = tmp;
			}
		}
		locateBL();
	}
	
	//Compare board to the solved board: if the same, return true
	private boolean isSolved() {
		for (int i=0; i<BOARD_SIZE; i++) {
			for (int j=0; j<BOARD_SIZE; j++) {
				if ( !board[i][j].equals(SOLVED_BOARD[i][j]) )
						return false;
			}
		}
		
		return true;
	}
	
	//Print board to console
	private void printBoard() {
		for (int i=0; i<BOARD_SIZE; i++) {
			for (int j=0; j<BOARD_SIZE; j++) {
				System.out.print(board[i][j] + "  ");
			}
			System.out.println("\n");
		}
	}
	
	private boolean isValidInstruction(String instruction) {
		return 	instruction.equals(RIGHT) || instruction.equals(LEFT) ||
				instruction.equals(UP) || instruction.equals(DOWN);
	}
	
	private boolean isValidMove(String instruction) {
		if ( !isValidInstruction(instruction) )
			return false;
		
		switch(instruction) {
		case LEFT:
			if (BLCol>0) break;
			return false;
		case RIGHT:
			if (BLCol<BOARD_SIZE-1) break;
			return false;
		case UP:
			if (BLRow>0) break;
			return false;
		case DOWN:
			if (BLRow<BOARD_SIZE-1) break;
			return false;
		}
		return true;
	}
	
	public void playerMove(Scanner player_in) {
		String instruction;
		System.out.println("Your move: ");
		
		//repeat until valid move has been made
		boolean moveMade = false;
		while (!moveMade) {
			while (!player_in.hasNext()) ; //wait for input
			instruction = player_in.nextLine();
			if (isValidMove(instruction)) {
				move(instruction);
				moveMade = true;
			}
			else
				System.out.println(BAD_INSTRUCTION_MESSAGE);
		}
		printBoard();
	}
	
	/**
	 * Presumes that the instruction indicates a valid move.
	 * @param instruction
	 */
	private void move(String instruction) {
		int xDir=0, yDir=0;		//direction to move BL in
		switch(instruction) {
		case LEFT:
			xDir = -1;
			break;
		case RIGHT:
			xDir = 1;
			break;
		case UP:
			yDir = -1;
			break;
		default: //DOWN
			yDir = 1;
			break;
		}
		
		String tmp = board[ BLRow+yDir ][ BLCol+xDir ];
		board[ BLRow+yDir ][ BLCol+xDir ] = board[BLRow][BLCol];
		board[BLRow][BLCol] = tmp;
		
		BLRow += yDir;
		BLCol += xDir;
	}

//STATIC METHODS
	
	public static int[] to1DIntArray(String oldArr[][]) {	
		
		int newArr[] = new int[BOARD_SIZE*BOARD_SIZE];
		boolean found;
		
		//iterate through newArr and oldArr
		for (int i=0; i<newArr.length; i++) {
			found = false;
			int jStart = i/BOARD_SIZE;
			int kStart = i%BOARD_SIZE;
			
			//find int value, by iterating through BOARD_SOLVED_POS array;
			for (int j=0; j<BOARD_SIZE && !found; j++) {
				for (int k=0; k<BOARD_SIZE && !found; k++) {
					if (oldArr[jStart][kStart].equals(SOLVED_BOARD[j][k])) {
						newArr[i] = (j*BOARD_SIZE) +k +1;
						found = true;
					}
				}
			}
		}
		return newArr;
	}
	
	// inversions in p[low..high-1]
	private static int inversions(int[] p,int low, int high) { 
	 int result = 0;
	 for (int i = low; i < high; i = i+1)
	 for (int j = i+1; j < high; j = j+1)
	 if ( p[i] > p[j] )
	 result = result+1;
	 return result;
	}

	public static boolean even_perm(int[] p) {
	 int n = inversions(p, 0, p.length);
	 return n%2 == 0;
	}
	
//MAIN
	public static void main(String arg0[]) {
		//testing();
		
		Chapman_15_Puzzle puzzle = new Chapman_15_Puzzle();
		Scanner player_in = new Scanner(System.in);
		
		//check whether puzzle solvable or not
		int array[] = to1DIntArray(puzzle.board);
		if (even_perm(array))
			System.out.println( SOLVEABLE_MESSAGE +"\n");
		else
			System.out.println( UNSOLVEABLE_MESSAGE +"\n");
				
		//run game
		while( !puzzle.isSolved() ) {
			puzzle.playerMove(player_in);
		}
		
		System.out.println( "Solved!" );
		player_in.close();
	}
	
//-----------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------
	
	
	public static void testing() {
		Chapman_15_Puzzle puzzle = new Chapman_15_Puzzle();
		int array[];
		
		//test inversions()
		for (int i=0; i<10000; i++) {
			puzzle = new Chapman_15_Puzzle();
			array = to1DIntArray(puzzle.board);
			if (even_perm(array))
				System.out.println( SOLVEABLE_MESSAGE );
			else
				System.out.println( UNSOLVEABLE_MESSAGE );
		}
		
		//make sure that initialised puzzles are not read as "solved"
		for (int i=0; i<10000; i++) {
			puzzle = new Chapman_15_Puzzle();
			if (puzzle.isSolved()) {
				System.out.println("["+i+ "] Solved!" );
				//print SOLVED_BOARD just to make sure it's correct
				for (int i2=0; i2<BOARD_SIZE; i2++) {
					for (int j=0; j<BOARD_SIZE; j++) {
						System.out.print(SOLVED_BOARD[i2][j] + "  ");
					}
					System.out.println("\n");
				}
				System.out.println("\n");
			}
			else
				System.out.println("["+i+ "]" );
		}
		
		//Test isValidMove()
		String tests[] = {"w", "a", "s", "d"};
		System.out.println( "BLRow [" +puzzle.BLRow+ "], BLCol [" +puzzle.BLCol+ "]" );
		for (int i=0; i<tests.length; i++) {
			System.out.print( tests[i] + ": " + puzzle.isValidMove(tests[i]) );
			System.out.print( ", " + puzzle.isValidMove(tests[i]) );
			System.out.print( ", " + puzzle.isValidMove(tests[i]) );
			System.out.println( ", " + puzzle.isValidMove(tests[i]) );
		}
	}



}