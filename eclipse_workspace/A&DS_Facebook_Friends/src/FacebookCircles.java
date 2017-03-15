/**
 * Class FacebookCircles: calculates the statistics about the friendship circles in facebook data.
 *
 * @author Joanna Whittam (15319524)
 *
 * @version 15/12/16 19:16
 */
public class FacebookCircles {
	public static final int NULL_ARRAY_SPACE = -1;

	int numberOfUsers, numberOfFriendships, numberOfCircles, largestCircle;
	int circleIDs[], friendships[][];
	
  /**
   * Constructor
   * @param numberOfFacebookUsers : the number of users in the sample data.
   * Each user will be represented with an integer id from 0 to numberOfFacebookUsers-1.
   */
  public FacebookCircles(int numberOfFacebookUsers) {
	  numberOfUsers = numberOfFacebookUsers;
	  numberOfFriendships = 0;
	  numberOfCircles = numberOfUsers;
	  largestCircle = 1;
	  friendships = new int[2][numberOfUsers];
	  
	  //initialise circle IDs
	  circleIDs = new int[numberOfUsers];
	  for (int i=0; i<circleIDs.length; i++)
		  circleIDs[i] = i;
  }

  /**
   * Creates a friendship connection between two users, represented by their corresponding integer ids.
   * @param user1 : int id of first user
   * @param user2 : int id of second  user
   */
  public void friends( int user1, int user2 ) {
	  //confirm enough space for new friendship / create space
	  if (numberOfFriendships == friendships[0].length) {
		  friendships = increaseSizeOfFriendships();
	  }
	  
	  //assign new friendship
	  friendships[0][numberOfFriendships] = user1;
	  friendships[1][numberOfFriendships] = user2;
	  numberOfFriendships++;
	  
	  //update circles
	  joinTwoCircles(user1, user2);
  }
  
  /**
   * @return the number of friend circles in the data already loaded.
   */
  public int numberOfCircles() {
	  return numberOfCircles;
  }

  /**
   * @return the size of the largest circle in the data already loaded.
   */
  public int sizeOfLargestCircle() {
	  return largestCircle;
  }

  /**
   * @return the size of the median circle in the data already loaded.
   */
  public int sizeOfAverageCircle() {
	  return numberOfUsers/numberOfCircles();
  }

  /**
   * @return the size of the smallest circle in the data already loaded.
   */
  public int sizeOfSmallestCircle() {
	  int circleSizes[] = new int[numberOfUsers];
	  
	  //count sizes
	  for (int i=0; i<circleIDs.length; i++) {
		  circleSizes[ circleIDs[i] ]++;
	  }
	  
	  //find & return smallest size
	  int smallestSize = circleSizes[ circleIDs[0] ]; //this index ensures that there's a circle with this ID
	  for (int i=0; i<circleSizes.length; i++) {
		  if ((circleSizes[i] < smallestSize) && (circleSizes[i] != 0))
			  smallestSize = circleSizes[i];
	  }
	  return smallestSize;
  }
  
  //----------------------------------------------------------------------------------------------
  //----------------------------------------------------------------------------------------------

  /**
   * Iterates through circles array and changes id of both circles to be equal.
   * Decrements the number of circles
   * @param user1 : int id of first user
   * @param user2 : int id of second  user
   */
  private void joinTwoCircles(int user1, int user2) {
	  int newCircleID, oldCircleID, circleSize;
	  
	  newCircleID = circleIDs[user1];
	  oldCircleID = circleIDs[user2];
	  circleSize = 0;
	  
	  
	  
	  //if users aren't already in the same circle
	  if (newCircleID != oldCircleID) {
		  for (int i=0; i<circleIDs.length; i++) {
			  if (circleIDs[i]==oldCircleID) 
				  circleIDs[i] = newCircleID;
			  if ((circleIDs[i]==newCircleID))// || (circleIDs[i]==oldCircleID))
				  circleSize++;
		  }
		  numberOfCircles--;
	  }
	  
	  if (circleSize>largestCircle)
		  largestCircle = circleSize;
  }
  
  /**
   * Copies friendships into new array of twice the original length
   * @param friendships : array to be resized
   * @return newFriendships : resized array
   */
  private int[][] increaseSizeOfFriendships() {
	  int newLength = friendships[0].length*2; // + (friendships[0].length/2);
	  int newFriendships[][] = new int[2][newLength];
	  
	  //copy previous friendships
	  for (int i=0; i<friendships.length; i++) {
		  for (int j=0; j<friendships[0].length; j++) {
			  newFriendships[i][j] = friendships[i][j];
		  }
	  }
	  return newFriendships;
  }
}







