import java.awt.Color;

/** A class whose objects represent the state of the Connect Four vertical grid during a game. */
public class C4Grid {
	private static final double MARGIN = 0.09;
	private static final double SQUARE_WIDTH = 0.062;
	private static final double GAP = 0.04;
	int maxCounters, totalCounters;
	private Counter[][] grid;
	
	C4Grid(int width, int height) {
		grid = new Counter[height][width];
		maxCounters = height*width;
		totalCounters = 0;
		for(int R=0; R<grid.length; R++)
			for(int C=0; C<grid[0].length; C++)
				grid[R][C] = new Counter(C4App.GREY);
		draw();
	}
	
	/** Returns true if there is space in this column for another counter. */
	public boolean columnHasSpace(int column)
	{ return grid[0][column].getColor().equals(C4App.GREY); }
	
	/** Inserts a color(counter) into the given column. */
	public void insertCounter(int C, Color counterColour)
	{
			int R = grid.length-1;
			while(!grid[R][C].getColor().equals(C4App.GREY) && R>=0) 
				R--;
			grid[R][C] = new Counter(counterColour);
			totalCounters++;
	}
	
	public boolean checkForC4(Color counterColor) {
		// Horizontal lines
		int countersInARow = 0;
		for(int R=0; R<grid.length; R++)
		{
			countersInARow = 0;
			for(int C=0; C<grid[0].length; C++)
			{
				if(grid[R][C].getColor().equals(counterColor))
					countersInARow++; 
				else countersInARow=0;
				if(countersInARow==4) return true;
			}
		}
		//Vertical lines
		for(int C=0; C<grid[0].length; C++)
		{
			countersInARow = 0;
			for(int R=grid.length-1; R>=0 && grid[0][C]!=null; R--)
			{
				if(grid[R][C].getColor().equals(counterColor))
					countersInARow++; 
				else countersInARow=0;
				if(countersInARow==4) return true;
			}
		}
		//Diagonal lines upwards
		for(int R=3; R<grid.length; R++)
		{
			countersInARow = 0;
			int r=R; 
			int c=0;
			while(r>=0 && c<grid[0].length)
			{
				if(grid[r][c].getColor().equals(counterColor))
					countersInARow++; 
				else countersInARow=0;
				if(countersInARow==4) return true;
				r--; 
				c++;
			}
		}
		for(int C=1; C<grid[0].length; C++)
		{
			countersInARow = 0;
			int r=grid.length-1; 
			int c=C;
			while(r>=0 && c<grid[0].length)
			{
				if(grid[r][c].getColor().equals(counterColor))
					countersInARow++; 
				else countersInARow=0;
				if(countersInARow==4) return true;
				r--; 
				c++;
			}
		}
		//Diagonal lines downwards
		for(int C=3; C<grid[0].length; C++)
		{
			countersInARow = 0;
			int r=grid.length-1;
			int c=C;
			while(r>=0 && c>=0)
			{
				if(grid[r][c].getColor().equals(counterColor))
					countersInARow++; 
				else countersInARow=0;
				if(countersInARow==4) return true;
				r--;
				c--;
			}
		}
		for(int R=grid.length-2; R>=3; R--)
		{
			countersInARow = 0;
			int r=R;
			int c=grid[0].length-1;
			while(r>=0 && c>=0)
			{
				if(grid[r][c].getColor().equals(counterColor))
					countersInARow++; 
				else countersInARow=0;
				if(countersInARow==4) return true;
				r--;
				c--;
			}
		}
		//Else
		return false;
	}
	
	public void draw()
	{
		StdDraw.setPenColor(C4App.BLACK);
		StdDraw.text(.5, .99, "CONNECT FOUR");
		for(int R=grid.length-1; R>=0; R--)
		{
			for(int C=0; C<grid[0].length; C++)
			{
				StdDraw.setPenColor(grid[R][C].getColor());
				double xPosition = MARGIN + (C*2*SQUARE_WIDTH+GAP);
				double yPosition = 0.9 - (R*2*SQUARE_WIDTH+GAP);
				StdDraw.filledSquare(xPosition, yPosition, SQUARE_WIDTH);
			}
		}
			
	}
		
	public Counter[][] getGrid() { return grid; }
	//public int getHeight() { return grid.length; }
	//public int getWidth() { return grid[0].length; }
	public int getMaxCounters() { return maxCounters; }
	public int getTotalCounters() { return totalCounters; }
}
