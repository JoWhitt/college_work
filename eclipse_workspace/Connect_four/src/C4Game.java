import java.util.Scanner;

/** A class whose objects represent a game of Connect Four in progress from beginning to end. */
public class C4Game {
	public static final int GRID_WIDTH = 7;
	public static final int GRID_HEIGHT = 6;
	private C4PlayerI currentPlayer, yellowPlayer, redPlayer;
	private C4Grid grid;
	
	C4Game() {
		grid = new C4Grid(GRID_WIDTH,GRID_HEIGHT);
		yellowPlayer = isHumanPlayer()? new C4HumanPlayer(C4App.YELLOW): new C4RandomAIPlayer(C4App.YELLOW);
		redPlayer = isHumanPlayer()? new C4HumanPlayer(C4App.RED): new C4RandomAIPlayer(C4App.RED);
		currentPlayer = yellowPlayer;
	} 

	//Instance methods
	public void play() 
	{
		while (!gameIsOver())
		{
			grid = currentPlayer.playCounter(grid);
			grid.draw();
			currentPlayer = (currentPlayer.equals(yellowPlayer))? redPlayer: yellowPlayer;
		}
		System.out.println((currentPlayer.equals(yellowPlayer)? "YELLOW":"RED")+" PLAYER WINS!");
	}
	
	public boolean gameIsOver() 
	{
		if (grid.getTotalCounters()==grid.getMaxCounters())
			return true;
		else if(grid.getTotalCounters()>=7)
			return grid.checkForC4(currentPlayer.getColor());
		else return false;
	}
	
	public boolean isHumanPlayer() 
	{
		Scanner input = new Scanner(System.in);
		String answer = "";
		boolean validInput = false;
		while(!validInput)
		{
			System.out.println("Should the player be human?");
			answer = input.next();
			if(answer.equals("YES") || answer.equals("Yes") || answer.equals("yes")
						|| answer.equals("NO") || answer.equals("No") || answer.equals("no"))
				validInput=true;
		}
		return answer.equals("YES") || answer.equals("Yes") || answer.equals("yes");
	}

	//Getters & Setters
	public C4PlayerI getYellowPlayer() { return yellowPlayer; }
	public C4PlayerI getRedPlayer() { return redPlayer; }
	public C4Grid getGrid() { return grid; }
	public void setYellowPlayer(C4PlayerI yellowPlayer) { this.yellowPlayer = yellowPlayer; }
	public void setRedPlayer(C4PlayerI redPlayer) { this.redPlayer = redPlayer; }
	public void setGrid(C4Grid grid) { this.grid = grid; }	
}
