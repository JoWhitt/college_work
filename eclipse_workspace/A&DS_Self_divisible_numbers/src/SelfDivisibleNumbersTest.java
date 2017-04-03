import static org.junit.Assert.*;
import java.util.ArrayList;

import org.junit.BeforeClass;
import org.junit.Test;


public class SelfDivisibleNumbersTest {

	static SelfDivisibleNumbers sdn;
	static Integer correctSDN[] = {381654729};
	
	@BeforeClass
	public static void oneTimeSetUp() throws Exception {
		sdn = new SelfDivisibleNumbers();
	}
	
	@Test
	public void constructorTest() {
		assertNotNull("Checking the constructor",sdn);
	}
	
	@Test
	public void correctNumbersTest() {		
		assertArrayEquals(correctSDN,sdn.SelfDivisibleNumbers.toArray());
	}
	
	@Test
	public void firstKDigitNumberTest() {		
		assertEquals("Testing getFirstKDigitNumber on {1,2,3,4,5,6,7,8,9}, 1", 1, 
				sdn.getFirstKDigitNumber(new int[] {1,2,3,4,5,6,7,8,9}, 1));
	}
	
	@Test
	public void NumberOfSelfDivisibleNumbersTest() {		
		assertEquals(1, sdn.getNumberOfSelfDivisibleNumbers());
	}
	
}