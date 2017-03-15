import java.awt.Color;
import java.util.Scanner;

/** An application will allow a user to start a new Connect Four game involving two players whose 
 * types are chosen by the user. */
public class C4App {
	//Constants
	public static final Color RED = new Color(255,0,20);
	public static final Color YELLOW = new Color(255,250,0);
	public static final Color BLACK = new Color(0,0,0);
	public static final Color GREY = new Color(200,200,200);
	public static final int CANVAS_HEIGHT = 600;
	public static final int CANVAS_WIDTH = 700;
	
	//Private Variables
	private static C4Game currentGame;

	//Main
	public static void main(String[] args) {
		StdDraw.setCanvasSize(CANVAS_WIDTH, CANVAS_HEIGHT);
		boolean finished = false;
		while(!finished)
		{
			currentGame = new C4Game();
			currentGame.play();
			finished = isFinished();
		}
		System.out.println("Thanks for playing!"); //TODO: correct output
	}

	//Methods
	private static boolean isFinished(){
		Scanner input = new Scanner(System.in);
		String answer = "";
		boolean validInput = false;
		while(!validInput)
		{
			System.out.println("Play again?");
			answer = input.next();
			if(answer.equals("YES") || answer.equals("Yes") || answer.equals("yes")
						|| answer.equals("NO") || answer.equals("No") || answer.equals("no"))
				validInput=true;
		}
		return !(answer.equals("YES") || answer.equals("Yes") || answer.equals("yes"));
	}
	
}
