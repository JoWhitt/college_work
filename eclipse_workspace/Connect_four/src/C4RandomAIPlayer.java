import java.awt.Color;
import java.util.Random;

/** A class which implements the C4PlayerI interface and whose objects represent Random AI Player 
 * (a computer) which is involved in a Connect Four game. */
public class C4RandomAIPlayer implements C4PlayerI {
	private Color counterColor;
	
	C4RandomAIPlayer(Color counterColor) {
		this.counterColor = counterColor;
	}

	/** Inserts counter of correct color into the given C4Grid column, if the column has space. */	
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
	
	public int selectAColumn(C4Grid grid)
	{
		Random generator = new Random();
		int column = Math.abs(generator.nextInt()%grid.getGrid()[0].length);
		return column;
	}
	
	public Color getColor() { return counterColor; }
}
