import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

//-------------------------------------------------------------------------
/**
 *  Test class for Doubly Linked List
 *
 *  @version 3.1 09/11/15 11:32:15
 *
 *  @author  Joanna Whittam (15319524)
 */

@RunWith(JUnit4.class)
public class BSTTest
{	
	/** <p>Test {@link BST#testIsEmpty()}.</p> */
	@Test
	public void testIsEmpty(){
		BST<Integer, Integer> bst = new BST<Integer, Integer>();
		assertTrue(bst.isEmpty());
		
		bst.put(0, 0);
		assertFalse(bst.isEmpty());
		
		bst.delete(0);
		assertTrue(bst.isEmpty());
	}

	/** <p>Test {@link BST#testSize()}.</p> */
	@Test
	public void testSize(){
		BST<Integer, Integer> bst = new BST<Integer, Integer>();
		assertEquals(0, bst.size());
		
		bst.put(0, 0);
		assertEquals(1, bst.size());
		
		bst.put(1, 1);
		bst.put(2, 2);
		bst.put(3, 3);
		bst.put(4, 4);
		assertEquals(5, bst.size());
	}

	/** <p>Test {@link BST#testContains()}.</p> */
	@Test
	public void testContains(){
		BST<Integer, Integer> bst = new BST<Integer, Integer>();
		assertFalse(bst.contains(0));
		
		bst.put(0, 0);
		assertTrue(bst.contains(0));
		assertFalse(bst.contains(1));
		
		bst.put(1, 1);
		bst.put(2, 2);
		bst.put(3, 3);
		bst.put(4, 4);
		assertTrue(bst.contains(2));
		assertFalse(bst.contains(7));
	}

	/** <p>Test {@link BST#testGet()}.</p> */
	@Test
	public void testGet(){
		BST<Integer, Integer> bst = new BST<Integer, Integer>();
		//cannot use assertEquals() to compare Value objects
		assertEquals(null, bst.get(0));
				
		bst.put(7, 7);
		bst.put(0, 0);
		
		assertTrue(bst.get(0).equals(0)); 
		assertEquals(null, bst.get(5)); 
		
		bst.put(1, 1);
		bst.put(2, 2);
		bst.put(3, 3);
		bst.put(4, 4);
		assertTrue(bst.get(4).equals(4));
		assertTrue(bst.get(7).equals(7)); 
		assertEquals(null, bst.get(6));  
	}
	
	/** <p>Test {@link BST#testPrintKeysInOrder()}.</p> */
	@Test
	public void testPrintKeysInOrder(){
		BST<Integer, Integer> charBST = new BST<Integer, Integer>();
		assertEquals("()", charBST.printKeysInOrder());
		
		charBST.put(4, 4);
		assertEquals("(()4())", charBST.printKeysInOrder());
		charBST.delete(4);
		assertEquals("()", charBST.printKeysInOrder());
		
		charBST.put(7, 7);
		charBST.put(8, 8);
		charBST.put(6, 6);
		charBST.put(5, 5);
		charBST.put(0, 0);
		charBST.put(2, 2);
		charBST.put(1, 1);
		assertEquals("((((()0((()1())2()))5())6())7(()8()))", charBST.printKeysInOrder());
	}

	/** <p>Test {@link BST#testPut()}.</p> */
	@Test
	public void testPut(){
		BST<Integer, Integer> bst = new BST<Integer, Integer>();
		assertEquals("()", bst.printKeysInOrder());
		
		bst.put(9, null);
		bst.put(4, 4);
		assertEquals("(()4())", bst.printKeysInOrder());
		
		bst.put(4, 4);
		assertEquals("(()4())", bst.printKeysInOrder());
		
		bst.put(6, 6);
		bst.put(7, 7);
		bst.put(5, 5);
		assertEquals("(()4((()5())6(()7())))", bst.printKeysInOrder());
		
		bst.put(0, 0);
		bst.put(2, 2);
		bst.put(1, 1);
		assertEquals("((()0((()1())2()))4((()5())6(()7())))", bst.printKeysInOrder());
	}

	/** <p>Test {@link BST#testHeight()}.</p> */
	@Test
	public void testHeight(){
		BST<Integer, Integer> bst = new BST<Integer, Integer>();
		assertEquals(-1, bst.height());
		
		bst.put(2, 2);
		assertEquals(0, bst.height());
		
		bst.put(1, 1);
		assertEquals(1, bst.height());
		
		bst.put(0, 0);
		bst.put(3, 3);
		assertEquals(2, bst.height());
		
		bst.put(5, 5);
		bst.put(4, 4);
		assertEquals(3, bst.height());
	}

	/** <p>Test {@link BST#testMedian()}.</p> */
	@Test
	public void testMedian(){
		BST<Integer, Integer> bst = new BST<Integer, Integer>();
		assertEquals(null, bst.median());
		
		bst.put(0, 0);
		//cannot use assertEquals() to compare Key objects
		assertTrue(bst.median().equals(0));
		
		bst.put(1, 1);
		assertTrue(bst.median().equals(0));
		
		bst = new BST<Integer, Integer>();
		bst.put(7, 7);
	    bst.put(8, 8);
	    bst.put(3, 3);
	    bst.put(1, 1);
	    bst.put(2, 2);
	    bst.put(6, 6);
	    bst.put(4, 4);
	    bst.put(5, 5); 
	    assertTrue(bst.median().equals(4));
	    
	    bst.put(9, 9);
	    assertTrue(bst.median().equals(5));
	}

	/** <p>Test {@link BST#testGetMax()}.</p> */
	@Test
	public void testGetMax(){
		BST<Integer, Integer> bst = new BST<Integer, Integer>();
		assertEquals(null, bst.getMax());
		
		bst.put(4, 4);
		assertTrue(bst.getMax().key.equals(4));
		bst.delete(4);
		assertEquals(null, bst.getMax());
		
		bst.put(7, 7);
		bst.put(8, 8);
		assertTrue(bst.getMax().key.equals(8));
		
		bst.put(6, 6);
		bst.put(5, 5);
		bst.put(0, 0);
		bst.put(2, 2);
		bst.put(1, 1);
		assertTrue(bst.getMax().key.equals(8));
	}

//------------------------------------------------------------------------	
  
  /** <p>Test {@link BST#prettyPrintKeys()}.</p> */
      
	 @Test
	 public void testPrettyPrintKeys() {
     BST<Integer, Integer> bst = new BST<Integer, Integer>();
     assertEquals("Checking pretty printing of empty tree",
             "-null\n", bst.prettyPrintKeys());
      
                          //  -7
                          //   |-3
                          //   | |-1
                          //   | | |-null
     bst.put(7, 7);       //   | |  -2
     bst.put(8, 8);       //   | |   |-null
     bst.put(3, 3);       //   | |    -null
     bst.put(1, 1);       //   |  -6
     bst.put(2, 2);       //   |   |-4
     bst.put(6, 6);       //   |   | |-null
     bst.put(4, 4);       //   |   |  -5
     bst.put(5, 5);       //   |   |   |-null
                          //   |   |    -null
                          //   |    -null
                          //    -8
                          //     |-null
                          //      -null
     
     String result = 
      "-7\n" +
      " |-3\n" + 
      " | |-1\n" +
      " | | |-null\n" + 
      " | |  -2\n" +
      " | |   |-null\n" +
      " | |    -null\n" +
      " |  -6\n" +
      " |   |-4\n" +
      " |   | |-null\n" +
      " |   |  -5\n" +
      " |   |   |-null\n" +
      " |   |    -null\n" +
      " |    -null\n" +
      "  -8\n" +
      "   |-null\n" +
      "    -null\n";
     assertEquals("Checking pretty printing of non-empty tree", result, bst.prettyPrintKeys());
     }

  
     /** <p>Test {@link BST#delete(Comparable)}.</p> */
     @Test
     public void testDelete() {
         BST<Integer, Integer> bst = new BST<Integer, Integer>();
         bst.delete(1);
         assertEquals("Deleting from empty tree", "()", bst.printKeysInOrder());
         
         bst.put(9, 9);
         bst.delete(9);
         assertEquals("Deleting the only element in a tree", "()", bst.printKeysInOrder());
         
         bst.put(9, 9);
         bst.put(10, 10);
         bst.delete(9);
         assertEquals("Deleting node with a null left branch", "(()10())", bst.printKeysInOrder());
         bst.delete(10);
         
         bst.put(7, 7);   //        _7_
         bst.put(8, 8);   //      /     \
         bst.put(3, 3);   //    _3_      8
         bst.put(1, 1);   //  /     \
         bst.put(2, 2);   // 1       6
         bst.put(6, 6);   //  \     /
         bst.put(4, 4);   //   2   4
         bst.put(5, 5);   //        \
                          //         5
         
         assertEquals("Checking order of constructed tree",
                 "(((()1(()2()))3((()4(()5()))6()))7(()8()))", bst.printKeysInOrder());
         
         bst.delete(9);
         assertEquals("Deleting non-existent key",
                 "(((()1(()2()))3((()4(()5()))6()))7(()8()))", bst.printKeysInOrder());
 
         bst.delete(8);
         assertEquals("Deleting leaf", "(((()1(()2()))3((()4(()5()))6()))7())", bst.printKeysInOrder());
 
         bst.delete(6);
         assertEquals("Deleting node with single child",
                 "(((()1(()2()))3(()4(()5())))7())", bst.printKeysInOrder());
 
         bst.delete(3);
         assertEquals("Deleting node with two children",
                 "(((()1())2(()4(()5())))7())", bst.printKeysInOrder());
     }
     
}
