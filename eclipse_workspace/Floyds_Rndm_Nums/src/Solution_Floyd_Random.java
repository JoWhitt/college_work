import java.util.*;

public class Solution_Floyd_Random
{
    RandomInterface r;

    public Solution_Floyd_Random(RandomInterface r) {
        this.r = r;
    }
    /**
     * @param m - sample size
     * @param n - pool size
     * @return m randomly generated numbers from 0..n-1
     */
    int[] getRandomNum(int m, int n)
    {
        int[] arr = new int[m];
        for ( int j = 0; j < m; j = j+1 )
            arr[j] =r.nextInt(n);

        return arr;
    }

    /**
     * @param m - sample size
     * @param n - pool size
     * @return m unique randomly generated numbers from 0...n-1
     */
    int[] getCombinations(int m, int n)
    {
        int[] rs = new int[m];

        for(int k = 0; k < Math.min(m,n);k++){
            do{
                rs[k] = r.nextInt(n);
            }while(k > 0 && Arrays.binarySearch(rs, 0,k-1,rs[k]) >=0);
        }

        return rs;
    }
    
    int[] Floyd_Random_Sample(int m, int n, int count, int[] result)
    {
	    Random rand_gen = new Random();
	    int rn;
	
	    if (m == 1) {
	   		rn = rand_gen.nextInt(n);
	   		result[count] = rn;
		}
		else
		{
			Floyd_Random_Sample(m-1, n-1, count, result);
			rn = rand_gen.nextInt(n);
			
			boolean rnInResult = false;
			for (int i=0; i<count && !rnInResult; i++) 
				rnInResult = (result[i] == rn);  
			
			if (rnInResult)
				result[count] = n-1;
			else
				result[count] = rn;
		}
	    return result;
    }


    // Algorithm F1. Floyd's Algorithm - Recursive
    /**
     * @param m - sample size
     * @param n - pool size
     */
    int[] randomSample(int m, int n)
    {    	
    	int result[] = new int[m];
    	int count = 0;
    	
    	Random rand_gen = new Random();
   	 	int rn;
   	 	
	   	if (m == 1) {
	   		rn = rand_gen.nextInt(n);
	   		result[count] = rn;
		}
		else
		{
			Floyd_Random_Sample(m-1, n-1, count, result);
			rn = rand_gen.nextInt(n);
			
			boolean rnInResult = false;
			for (int i=0; i<count && !rnInResult; i++) 
				rnInResult = (result[i] == rn);  
			
			if (rnInResult)
				result[count] = n-1;
			else
				result[count] = rn;
		}
	    return result;
    }

    // Iterative Solution to Random Sample, Algorithm F2.
    /**
     * @param m - sample size
     * @param n - pool size
     * @return m unique randomly generated numbers from 0...n-1
     */
    int[] recRandomSample(int m, int n)
    {
    	int count = 0;
    	int s[] = new int[m];
    	for (int j=(n-m+1); j<=n; j++) {
    		int t = getRandomNum(1,j)[0];
    		
    		boolean TInS = false;
    		for (int i=0; i<count && !TInS; i++)
    			TInS = (t == s[i]);
   			s[count++] = (!TInS)? t: j;
    	}
        return s;
    }

    // Solution to Random Permutation, Algorithm P.
    int[] floydPermutations(int m, int n)
    {
    	int count = 0;
    	int s[] = new int[m];
    	for (int j=(n-m+1); j<=n; j++) {
    		int t = getRandomNum(1,j)[0];
    		
    		boolean TInS = false;
    		int i;
    		for (i=0; i<count && !TInS; i++)
    			TInS = (t == s[i]);
    		
    		if (TInS) {
    			for(int k=(m-count); k<=i; k++){ // '<='? sure about that?
    				s[k-1] = s[k];
    			}
    			s[i] = t;
    		}
    		else
    			s[m-count] = t;
    		count++;
    	}
        return s;
    }
}





