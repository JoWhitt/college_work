import org.junit.Test;
import static org.junit.Assert.*;

public class CheckTriangleTest {
	
	@Test
	public void createCheckTriangleObject() {
		CheckTriangle ct = new CheckTriangle();
	}

    @Test
    public void checkTriangleTrueTest(){
    	double[] arr = {15,15,15};
        assertTrue(arr.toString()+" is a triangle",CheckTriangle.form_triangle(arr));
    	
        double[] arr1 = {3, 4, 6};
        assertTrue(arr.toString()+" is a triangle",CheckTriangle.form_triangle(arr1));
    }

    @Test
    public void checkTriangleFalseTest(){
        double[] arr = {25,5,5};
        assertFalse(arr.toString()+" should not be a triangle",CheckTriangle.form_triangle(arr));
        
        double[] arr2 = {};
        assertFalse(arr.toString()+" should not be a triangle",CheckTriangle.form_triangle(arr2));
        
        double[] arr3 = {25,5,21,9};
        assertFalse(arr.toString()+" should not be a triangle",CheckTriangle.form_triangle(arr3));
    }

    @Test
    public void kindTriangleFalseTest(){
        double[] arr = {25,5,5};
        assertEquals(arr.toString() + " should not be a triangle", 0, CheckTriangle.kind_triangle(arr));
    }

    @Test
    public void kindTriangleObtuseTest(){
        double[] arr = {3,4,6};
        assertEquals(arr.toString()+" should be obtuse",3, CheckTriangle.kind_triangle(arr));
    }

    @Test
     public void kindTriangleRightAngledTest(){
        double[] arr = {3,4,5};
        assertEquals(arr.toString()+" should be right-angled",1, CheckTriangle.kind_triangle(arr));
    }

    @Test
     public void kindTriangleAcuteTest(){
        double[] arr = {5,5,5};
        assertEquals(arr.toString()+" should be acute",2,CheckTriangle.kind_triangle(arr));
        
        double[] arr1 = {50,50,0.05};
        assertEquals(arr.toString()+" should be acute",2,CheckTriangle.kind_triangle(arr1));
    }

    
//TESTING OF UNUSED METHODS
     /*@Test
     public void maxTest(){
        double[] arr = {6,7,5};
        assertEquals("7 is the max in "+ arr.toString(),7,CheckTriangle.max(arr),0);
        
        double[] arr1 = {6,5,4,7.5,7.6};
        assertEquals("7.6 is the max in "+ arr.toString(),7.6,CheckTriangle.max(arr1),1);
        
        double[] arr2 = {1,3,0,3};
        assertEquals("3 is the max in "+ arr.toString(),3,CheckTriangle.max(arr2),0);
        
        double[] arr3 = {3,3,3};
        assertEquals("3 is the max in "+ arr.toString(),3,CheckTriangle.max(arr3),0);
    }

    @Test
    public void minTest(){
        double[] arr = {6,5,4};
        assertEquals("4 is the min in "+ arr.toString(),4,CheckTriangle.min(arr),0);
        
        double[] arr1 = {6,5,4.1,4.3,7};
        assertEquals("4.3 is the min in "+ arr.toString(),4.3,CheckTriangle.min(arr1),1);
        
        double[] arr2 = {1,0,3,3};
        assertEquals("0 is the min in "+ arr.toString(),0,CheckTriangle.min(arr2),0);
        
        double[] arr3 = {3,3,3};
        assertEquals("3 is the min in "+ arr.toString(),3,CheckTriangle.min(arr3),0);
    }

    @Test
     public void sumTest(){
        double[] arr = {6,5,4.1,4.3,7};
        assertEquals("26.4 is the sum in "+ arr.toString(),26.4,CheckTriangle.sum(arr),1);
        
        double[] arr1 = {0,0,0};
        assertEquals("0 is the sum in "+ arr.toString(),0,CheckTriangle.sum(arr1),1);
    }*/
}