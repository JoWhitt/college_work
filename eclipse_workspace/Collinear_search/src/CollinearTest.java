import static org.junit.Assert.*;

import org.junit.*;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import java.util.Arrays;

import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;

/**
 *  Test class for Collinear.java
 *
 *  @author  
 *  @version 03/10/16 17:10:35
 */
@RunWith(JUnit4.class)
public class CollinearTest
{
    //~ Constructor ........................................................
    @Test
    public void testConstructor()
    {
      new Collinear();
    }

    //~ Public Methods ........................................................

    // ----------------------------------------------------------
    /**
     * Check that the two methods work for empty arrays
     */
    @Test
    public void testEmpty()
    {
        int expectedResult = 0;

        assertEquals("countCollinear failed with 3 empty arrays",       expectedResult, Collinear.countCollinear(new int[0], new int[0], new int[0]));
        assertEquals("countCollinearFast failed with 3 empty arrays", expectedResult, Collinear.countCollinearFast(new int[0], new int[0], new int[0]));
    }

    // ----------------------------------------------------------
    /**
     * Check for no false positives in a single-element array
     */
    @Test
    public void testSingleFalse()
    {
        int[] a3 = { 15 };
        int[] a2 = { 5 };
        int[] a1 = { 10 };
        int expectedResult = 0;

        assertEquals("countCollinear({10}, {5}, {15})",       expectedResult, Collinear.countCollinear(a1, a2, a3) );
        assertEquals("countCollinearFast({10}, {5}, {15})", expectedResult, Collinear.countCollinearFast(a1, a2, a3) );
    }

    // ----------------------------------------------------------
    /**
     * Check for no false positives in a single-element array
     */
    @Test
    public void testSingleTrue()
    {
    	int[] a1 = { 10, 15, 5 };
    	int[] a2 = { 5 }; 
        int[] a3 = { 15, 5 };             
        int expectedResult = 1;

        assertEquals("countCollinear(" + Arrays.toString(a1) + "," + Arrays.toString(a2) + "," + Arrays.toString(a3) + ")",     expectedResult, Collinear.countCollinear(a1, a2, a3));
        assertEquals("countCollinearFast(" + Arrays.toString(a1) + "," + Arrays.toString(a2) + "," + Arrays.toString(a3) + ")", expectedResult, Collinear.countCollinearFast(a1, a2, a3));
    }
    
    // ----------------------------------------------------------
    /**
     * Check for no false positives in a multiple-element array
     */
    @Test
    public void testMultipleTrue()
    {
    	int[] a1 = { 0, 10, 51 };
    	int[] a2 = { 2, 11, 55 };
    	int[] a3 = { 4, 12, 59 };
    	int expectedResult = 3;
    	
    	assertEquals("countCollinear(" + Arrays.toString(a1) + "," + Arrays.toString(a2) + "," + Arrays.toString(a3) + ")",     expectedResult, Collinear.countCollinear(a1, a2, a3));
        assertEquals("countCollinearFast(" + Arrays.toString(a1) + "," + Arrays.toString(a2) + "," + Arrays.toString(a3) + ")", expectedResult, Collinear.countCollinearFast(a1, a2, a3));
    }
    
    
    // ----------------------------------------------------------
    /**
     * Check sort function, for a pre-sorted array
     */
    @Test
    public void testSortingPresortedArray()
    {
        int[] a = { 1, 2, 3 };
        Collinear.sort(a);
        
        assertTrue("Array sorted: ", a[0]<a[1] && a[1]<a[2]);         
    }
    
 // ----------------------------------------------------------
    /**
     * Check sort function, for an unsorted array
     */
    @Test
    public void testSortingUnsortedArray()
    {
        int[] a = { 3, 2, 1 };
        Collinear.sort(a);
        
        assertTrue("Array sorted: ", a[0]<a[1] && a[1]<a[2]);       
    }
    
    // ----------------------------------------------------------
    /**
     * Check binary search, for non-existing value 
     */
    @Test
    public void testBinarySearchValueNotFound()
    {
        int[] a = { 0, 2, 4, 6, 8, 10 };
        int toFind = 7;
        
        assertFalse(Collinear.binarySearch(a,toFind));
    }
    
    // ----------------------------------------------------------
    /**
     * Check binary search, for non-existing value 
     */
    @Test
    public void testBinarySearchValueFound()
    {
        int[] a = { 0, 2, 4, 6, 8, 10 };
        int toFind = 4;
        
        assertTrue(Collinear.binarySearch(a,toFind));
    }
    
    // ----------------------------------------------------------
    /**
     *  Main Method.
     *  Use this main method to create the experiments needed to answer the experimental performance questions of this assignment.
     *
     *  You should read the lecture notes and/or book to understand how to correctly implement the main methods.
     *  You can use any of the provided classes to read from files, and time your code.
     *
     */
     public static void main(String[] args)
     {
    	int N = 1000;
    	String[] files = {"r01000-1.txt", "r01000-2.txt", "r01000-3.txt"};
    	int[] a1 = new int[N];
    	int[] a2 = new int[N];
    	int[] a3 = new int[N];
    	int[][] arrays = {a1, a2, a3};
    	
    	for (int i=0; i<arrays.length; i++) {
    		File file = new File(files[i]);
        	try {
        		Scanner s = new Scanner(file);
        		for (int j=0; j<arrays[i].length; j++)
        			arrays[i][j] = s.nextInt();
        		s.close();
        	}
        	catch (FileNotFoundException e){
        		System.err.println("File "+files[i]+" not found.");
        	}
    	}
    	
    	Stopwatch timer1 = new Stopwatch();
    	Collinear.countCollinear(a1, a2, a3);
    	double t1 = timer1.elapsedTime();
    	
    	Stopwatch timer2 = new Stopwatch();
    	Collinear.countCollinearFast(a1, a2, a3);
    	double t2 = timer2.elapsedTime();
    	
    	System.out.print("For N="+N
    			+"\ncountCollinear() took:"+t1+"s"
    			+"\ncountCollinearFast() took:"+t2+"s");
     }
}



