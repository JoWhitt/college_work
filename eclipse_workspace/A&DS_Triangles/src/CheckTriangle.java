public class CheckTriangle
{

//CONSTANTS
    public static final double TINY_DIFF = 0.0001;

    public static final int NOT_TRI = 0;
    public static final int RIGHT_ANGLED_TRI = 1;
    public static final int ACUTE_TRI = 2;
    public static final int OBTUSE_TRI = 3;
    
//METHODS
    public static boolean form_triangle(double[] ls)
    {
    	if (ls.length != 3)
    		return false;
    	
    	insertion_sort(ls);
    	double a = ls[0];
    	double b = ls[1];
    	double c = ls[2];
    	
    	return (c < a+b);
    }

    public static int kind_triangle(double[] ls)
    {
    	if ( !form_triangle(ls) )
    		return NOT_TRI;
    	
    	insertion_sort(ls);
    	double a = ls[0];
    	double b = ls[1];
    	double c = ls[2];
    	
    	
    	if ( a*a + b*b == c*c )
    		return RIGHT_ANGLED_TRI;
    	if ( a*a + b*b > c*c )
    		return ACUTE_TRI;
    	return OBTUSE_TRI;
    }

    //sorts list into ascending order
    public static void insertion_sort(double[] arr)
    {
    	for(int i=0; i<arr.length; i++)
    	{
    		for (int j=i; j>0; j--){
    			if (arr[j]<arr[j-1])
    			{
    				double tmp = arr[j];
    				arr[j] = arr[j-1];
    				arr[j-1] = tmp;
    			}
    		}
    	}
    }
    
    
    
    
//UNUSED METHODS    
    /*//calculate the sum of arr
    public static double sum(double[] arr)
    {
    	double result = 0;
    	
    	for (int i=0; i<arr.length; i++)
    		result += arr[i];
    		
        return result;
    }

	//returns the maximum element of arr
    public static double max(double[] arr)
    {
    	double max = 0.0;
    	
    	for (int i=0; i<arr.length; i++)
    	{
    		if (arr[i] > max)
    			max = arr[i];
    	}
        return max;
    }

    //returns the minimum element of arr
    public static double min(double[] arr)
    {
    	double min = arr[0];
    	
    	for (int i=1; i<arr.length; i++)
    	{
    		if (arr[i] < min)
    			min = arr[i];
    	}
        return min;
    }*/
}