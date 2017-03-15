import java.awt.Color;

/** An interface which specifies (abstracts) the operations (methods) which any type of Connect 
 * Four Player class must provide (implement). */
public interface C4PlayerI {

	/** Inserts counter of correct color into the given C4Grid column, if the column has space. */
	public C4Grid playCounter(C4Grid grid);
	/** Returns the column number to insert a counter into. */
	public int selectAColumn(C4Grid grid);
	
	public Color getColor();
}
