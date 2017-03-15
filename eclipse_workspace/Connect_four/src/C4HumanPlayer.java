 import java.awt.Color;
import java.util.Scanner;
 
 /** A class which implements the C4PlayerI interface and whose objects represent a human player (a user) 
  * who is involved in a Connect Four game. */
public class C4HumanPlayer implements C4PlayerI{
	private Color counterColor;
	
	C4HumanPlayer(Color counterColor) {
		this.counterColor = counterColor;
	}
	
	public C4Grid playCounter(C4Grid grid) {
		int column;
		boolean validColumnPicked = false;
		while(!validColumnPicked)
		{
			column = selectAColumn(grid);
			if(grid.columnHasSpace(column))
			{
				grid.insertCounter(column, counterColor);
				validColumnPicked = true;
			}
			else
				validColumnPicked = false;
		}
		return grid;
	}

	public int selectAColumn(C4Grid grid) {
		Scanner input = new Scanner(System.in);
		boolean validColumn = false;
		while(!validColumn)
		{
			System.out.println(((counterColor==C4App.YELLOW)?"Yellow":"Red")+" player, choose a column:");
			int column = input.nextInt(); //TODO: error checking
			if(column<grid.getGrid()[0].length)
				if(grid.columnHasSpace(column))
					return column;
		}
		return 0;
	}
	
	public Color getColor() { return counterColor; }
}
