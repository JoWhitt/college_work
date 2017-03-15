import java.util.*;

public class Solution_Floyd_Random
{
    RandomInterface r;
    ArrayList<Integer> samp_rand = new ArrayList<Integer>();
    
    public Solution_Floyd_Random(RandomInterface r) {
        this.r = r;
    }
    
    int[] toArray(ArrayList<Integer> arrayList) {
    	int[] result = new int[arrayList.size()];
    	for (int i=0; i<arrayList.size(); i++) {
    		result[i] = arrayList.get(i);
    	}
    	return result;
    }
    
    /**
     * @param m - sample size
     * @param n - pool size
     * @return m randomly generated numbers from 0..n-1
     */
    int[] getRandomNum(int m, int n) {
        int[] arr = new int[m];
        for ( int j=0; j<m; j++ )
            arr[j] = r.nextInt(n);
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

    // Algorithm F1. Floyd's Algorithm - Recursive
    /**
     * @param m - sample size
     * @param n - pool size
     * @return m unique randomly generated numbers from 0...n-1 (recursive solution)
     */
    int[] randomSample(int m, int n) {
    	return toArray(recursive(m,n));
    }    
    
    ArrayList<Integer> recursive(int m, int n) {
    	if (m==0)
    		return new ArrayList<Integer>();
    	else {
    		ArrayList<Integer> S = recursive(m-1,n-1);
    		int t = r.nextInt(n);
    		S.add(t);
    		return S;
    	}
    	
    }

    // Iterative Solution to Random Sample, Algorithm F2.
    /**
     * @param m - sample size
     * @param n - pool size
     * @return m unique randomly generated numbers from 0...n-1
     */
    int[] recRandomSample(int m, int n) {
        int S[] = new int[m];
        int count = 0;
        
        for (int j=(n-m); j<n; j++) {
        	int t = r.nextInt(j);
        	
        	S[count++] = t;
        }
        return S;
    }

    // Solution to Random Permutation, Algorithm P.
    int[] floydPermutations(int m, int n) {
    	samp_rand = new ArrayList<Integer>();
    	
    	for(int j=(n-m); j<n; j++) {
    		int t = r.nextInt(j);
    		if(!samp_rand.contains(t))
    			samp_rand.add(0,t);
    		else
    			samp_rand.add(samp_rand.indexOf(t)+1, j);
    	}
    	
    	return toArray(samp_rand);
    }

}
