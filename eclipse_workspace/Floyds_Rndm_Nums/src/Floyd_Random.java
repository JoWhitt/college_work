import java.util.*;
public class Floyd_Random
{
    ArrayList<Integer> samp_rand = new ArrayList<Integer>();
    
    Floyd_Random()
    {
        rand_seq_rep(12, 3);
        simple_sample(5,10);
        Floyd_Random_Sample(10,16); // choose sample of size 10 from 0..16
        TextIO.putln("(Algorithm F1) Floyd Random Sample = " + samp_rand);
    } // Floyd_Random
    
    void rand_seq_rep(int m, int n)
    { // Sampling with repetition; 
      // generate a sequence of m numbers from 0..n-1
      
        TextIO.putln("Random sequence with repetition ");
        Random rand_gen = new Random();
        for ( int j = 0; j < m; j = j+1 )
            TextIO.put(rand_gen.nextInt(n) + "  ");
        TextIO.putln();
    } // rand_seq_rep
        
    void simple_sample(int m, int n)
    { // Algorithm S. A Typical Sampling Algorithm 
        
        ArrayList<Integer> rand_samp = new ArrayList<Integer>();
        Random rand_gen = new Random(); 
        int rn;
        int k = 0;
        while ( k < m )
        {
            rn = rand_gen.nextInt(n);  // 0 <= rn < n 
            if ( !rand_samp.contains(rn) )
            {
                rand_samp.add(rn);
                k = k+1;
            }
        }
        TextIO.putln("\nAlgorithm S. Random Sample(without repetition) \nChoose "+m+" from 0.." +(n-1)+" = " + rand_samp);
        TextIO.putln();
    } // simple_sample
    
    
    void Floyd_Random_Sample(int m, int n)
    { // Algorithm F1. Floyd's Algorithm - Recursive 
        
        Random rand_gen = new Random();  
        int rn;
        
        if ( m == 1 )
        {
             rn = rand_gen.nextInt(n);
             samp_rand.add(rn);
        }
        else
        {
            Floyd_Random_Sample(m-1, n-1);
            rn = rand_gen.nextInt(n);
            if ( samp_rand.contains(rn) )
            {
                samp_rand.add(n-1);
            }
            else
                samp_rand.add(rn);  
        }
    } // Floyd_Random_Sample

} // Floyd_Random