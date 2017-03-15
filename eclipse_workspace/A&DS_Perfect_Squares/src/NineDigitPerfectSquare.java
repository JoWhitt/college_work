import java.util.ArrayList;

/**
 * CS2010 (Hilary Term) - Assignment 1
 *
 * Nine Digit Perfect Square
 *
 * A natural number, p, is a perfect square if for some natural number k, k^2=p.
 * For example, 16 is a perfect square, as 4^2=16. The number 20 is not a
 * perfect square as there is no natural number k such that k^2=20.
 *
 * Problem: Develop an algorithm that will find all nine-digit perfect squares
 * that use all nine digits exactly once. For example, 139,854,276 is a solution
 * (the first) as 11,826^2=139,854,276.
 *
 * 1) Fill in the implementation of the methods described in this file.
 *
 * 2) Test your implementation by developing suitable test suite in the
 * NineDigitPerfectSquareTest JUnit test case.
 *
 * @author: Joanna Whittam (15319524)
 *
 */

public class NineDigitPerfectSquare {

    /**
     * A method to return an array containing all squares between low and high (inclusive)
     *
     * @param low: lowest perfect square
     * @param high: largest perfect square
     *
     * @return an array containing all the perfect squares between low and high (inclusive)
     */
	public int[] perfectSquaresBetween(int low, int high){
    	ArrayList<Integer> result = new ArrayList<Integer>();
    	
    	int sqrt = (int) Math.sqrt(low) +1;
    	int num = sqrt*sqrt;
    	while(num <= high)
    	{
    		if (containsAllDigitsOnce(num))
    			result.add(num);
    		sqrt++;
    		num = sqrt*sqrt;
    	}
    	
    	
    	int new_result[] = new int[result.size()];
    	for (int i=0; i<new_result.length; i++){
    		new_result[i] = result.get(i);
    	}
    	
    	return new_result;
	}

    public int countNineDigitPerfectSquares(){
        return getNineDigitPerfectSquares().length;
    }

    /**
     * A method to determine if the number specified in parameter "number"
     * contains all 9 digits exactly once.
     *
     * @param number
     *            : A number to be tested
     * @return whether the number contains all 9 digits exactly once
     */
    public boolean containsAllDigitsOnce(int number) {
    	boolean valid = true;
    	boolean found[] = new boolean[9];
    	int digit;
    	
    	while(number!=0 && valid)
    	{
    		digit = number%10;
    		if (digit == 0)
    			valid = false;
    		else if ( found[digit-1] ) //digit already found
    			valid = false;
    		else found[digit-1] = true; //mark digit found
    		number /= 10;
    	}
    	
    	for (int i=0; i<found.length && valid; i++)
    		if (found[i]==false)
    			valid = false;
    	
    	return valid;
    }


    /**
     * A method to return an array containing all the squares discovered
     *
     * @return an array containing all of the perfect squares which
     * contain all digits 1..9 exactly once.
     */
    public int[] getNineDigitPerfectSquares() {
    	int min=100000000, max=999999999;
    	return perfectSquaresBetween(min,max);
    }
}



