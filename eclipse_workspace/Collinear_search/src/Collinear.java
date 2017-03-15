// -------------------------------------------------------------------------
/**
 *  This class contains only two static methods that search for points on the
 *  same line in three arrays of integers. 
 *
 *  @author  
 *  @version 03/10/16 17:10:35
 */
class Collinear
{

   // ----------------------------------------------------------
    /**
     * Counts for the number of non-horizontal lines that go through 3 points in arrays a1, a2, a3.
     * This method is static, thus it can be called as Collinear.countCollinear(a1,a2,a3)
     * @param a1: An UNSORTED array of integers. Each integer a1[i] represents the point (a1[i], 1) on the plain.
     * @param a2: An UNSORTED array of integers. Each integer a2[i] represents the point (a2[i], 2) on the plain.
     * @param a3: An UNSORTED array of integers. Each integer a3[i] represents the point (a3[i], 3) on the plain.
     * @return the number of points which are collinear and do not lie on a horizontal line.
     *
     * Array a1, a2 and a3 contain points on the horizontal line y=1, y=2 and y=3, respectively.
     * A non-horizontal line will have to cross all three of these lines. Thus
     * we are looking for 3 points, each in a1, a2, a3 which lie on the same
     * line.
     *
     * Three points (x1, y1), (x2, y2), (x3, y3) are collinear (i.e., they are on the same line) if
     * 
     * x1(y2−y3)+x2(y3−y1)+x3(y1−y2)=0 
     *
     * In our case y1=1, y2=2, y3=3.
     *
     * You should implement this using a BRUTE FORCE approach (check all possible combinations of numbers from a1, a2, a3)
     *
     * ----------------------------------------------------------
     *
     * Experimental Performance:
     * -------------------------
     *  Write the running time of the algorithm when run with the following input sizes
     *  
     *  Input Size N      Running Time (sec)
     *  ------------------------------------
     *  1000              0.717
     *  2000              5.305
     *  4000              41.337
     *
     *  Assuming that the running time of your algorithm is of the form aN^b,
     *  estimate 'b' and 'a' by fitting a line to the experimental points:
     *
     *  b = 2.925
     *  a = 1.2e-9
     *
     *  What running time do you predict using your results for input size 5000?
     *  What is the actual running time you get with such an input?
     *  What is the error in percentage?
     *
     *  Error = ( (Actual time) - (Predicted time) ) * 100 / (Predicted time)
     *
     *  Input Size N      Predicted Running Time (sec)        Actual Running Time (sec)       Error (%)
     *  ------------------------------------------------------------------------------------------------
     *  5000              79.4                                81.061                          2.09
     * 
     *  Approximate Mathematical Performance:
     *  -------------------------
     *
     *  Using an appropriate cost model, give the performance of your algorithm.
     *  Explain your answer.
     *
     *  Performance: ~3N^3
     *
     *  Explanation:
     *  	Assuming that we only count array accesses, Line 82 is the only line in this function that is relevant to 
     *  	this cost model. There are 3 array accesses in the line and the line will be executed N^3 times (since it is
     *  	positioned within 3 nested loops). Therefore performance can be calculated as ~3N^3. The '~' symbol indicates
     *  	that counting only the array accesses is not entirely accurate.
     */
    static int countCollinear(int[] a1, int[] a2, int[] a3)
    {
    	int count = 0;
    	for (int i=0; i<a1.length; i++) {
    		for (int j=0; j<a2.length; j++) {
    			for (int k=0; k<a3.length; k++) {
    				if ( (  (a1[i]*(2-3)) + (a2[j]*(3-1)) + (a3[k]*(1-2))) == 0 )
    					count++;
    			}
    		}
    	}
    	return count;
    }

    // ----------------------------------------------------------
    /**
     * Counts for the number of non-horizontal lines that go through 3 points in arrays a1, a2, a3.
     * This method is static, thus it can be called as Collinear.countCollinearFast(a1,a2,a3)
     * @param a1: An UNSORTED array of integers. Each integer a1[i] represents the point (a1[i], 1) on the plain.
     * @param a2: An UNSORTED array of integers. Each integer a2[i] represents the point (a2[i], 2) on the plain.
     * @param a3: An UNSORTED array of integers. Each integer a3[i] represents the point (a3[i], 3) on the plain.
     * @return the number of points which are collinear and do not lie on a horizontal line.
     *
     * In this implementation you should make non-trivial use of InsertionSort and Binary Search.
     * The performance of this method should be much better than that of the above method.
     *
     * Experimental Performance:
     * -------------------------
     *  Measure the running time of the algorithm when run with the following input sizes
     *  
     *  Input Size N      Running Time (sec)
     *  ------------------------------------
     *  1000              0.091
     *  2000              0.324
     *  4000              1.429
     *  5000              2.454
     *
     *
     *  Compare Implementations:
     *  ------------------------
     *  Show the speedup achieved by this method, using the times you got from your experiments.
     *
     *  Input Size N      Speedup = (time of countCollinear)/(time of countCollinearFast)
     *  ---------------------------------------------------------------------------------
     *  1000              7.87912088
     *  2000              16.3734568
     *  4000              28.9272218
     *  5000              33.0321923
     *
     *
     *  Approximate Mathematical Performance:
     *  -------------------------------------
     *
     *  Using an appropriate cost model, give the performance of your algorithm.
     *  Explain your answer.
     *
     *  Performance: (N^2)logN
     *
     *  Explanation: 
     *  	The most costly operation in this function is Line 146, where binary search is implemented. Arrays 1 and 2 
     *  	are each accessed N times, while Array 3 is only accessed logN times (due to the binary search). Therefore
     *  	The cost of this function will be N*N*logN.
     */
    static int countCollinearFast(int[] a1, int[] a2, int[] a3)
    {
    	int count = 0;
    	sort(a3);
    	for (int i=0; i<a1.length; i++) {
    		for(int j=0; j<a2.length; j++) {
    			int coordinateWanted = a1[i]*(-1) + a2[j]*(2);
    			if (binarySearch(a3, coordinateWanted))
    				count++;
    		}
    	}
    	return count;
    }

    // ----------------------------------------------------------
    /**
     * Sorts an array of integers according to InsertionSort.
     * This method is static, thus it can be called as Collinear.sort(a)
     * @param a: An UNSORTED array of integers. 
     * @return after the method returns, the array must be in ascending sorted order.
     *
     * ----------------------------------------------------------
     *
     * Approximate Mathematical Performance:
     * -------------------------------------
     *  Using an appropriate cost model, give the performance of your algorithm.
     *  Explain your answer.
     *
     *  Performance: ~N^2 (worst case scenario)
     *
     *  Explanation: 
     *  	The inner loop of this function will iterate (N^2)/2 times in the worst case scenario (where ever element has to 
     *  	be moved to position 0 in the array. The most costly operation within that loop is Line 184 with two array accesses.
     *  	Therefore the cost of that line will be (2N^2)/2, or N^2.
     *
     */
    static void sort(int[] a)
    {
    	int temp;
    	int j;
    	for (int i=1; i<a.length; i++) {
    		j=i-1;
    		while (j>=0) {
    			if (a[j+1]<a[j]) {
    				temp = a[j+1];
    				a[j+1] = a[j];
    				a[j] = temp;
    			}
    			j--;
    		}
    	}
    }

    // ----------------------------------------------------------
    /**
     * Searches for an integer inside an array of integers.
     * This method is static, thus it can be called as Collinear.binarySearch(a,x)
     * @param a: A array of integers SORTED in ascending order.
     * @param x: An integer.
     * @return true if 'x' is contained in 'a'; false otherwise.
     *
     * ----------------------------------------------------------
     *
     * Approximate Mathematical Performance:
     * -------------------------------------
     *  Using an appropriate cost model, give the performance of your algorithm.
     *  Explain your answer.
     *
     *  Performance: ~logN (worst case scenario)
     *
     *  Explanation: 
     *  	In the worst case scenario Line 222 will be executed logN times. This is since the problem size of the array is 
     *  	being constantly divided by 2.
     *
     */
    static boolean binarySearch(int[] a, int toFind)
    {
    	boolean found = false;
    	int high = a.length-1;
    	int low = 0;
    	int mid;
    	while (!found && low<=high) {
    		mid = low + (high-low)/2;
    		if (a[mid]<toFind)		low=mid+1;
    		else if (a[mid]>toFind)	high=mid-1;
    		else found=true;
    	}
    	return found;
    }

}

