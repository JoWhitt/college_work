import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

//-------------------------------------------------------------------------
/**
 *  Test class for Doubly Linked List
 *
 *  @author  
 *  @version 13/10/16 18:15
 */
@RunWith(JUnit4.class)
public class DoublyLinkedListTest
{
    //~ Constructor ........................................................
    @Test
    public void testConstructor()
    {
      new DoublyLinkedList<Integer>();
    }

    //~ Public Methods ........................................................

    // ----------------------------------------------------------
    /**
     * Check if the insertBefore() works.
     */
    @Test
    public void testInsertBefore()
    {
        // test non-empty list
        DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(0,1);
        testDLL.insertBefore(1,2);
        testDLL.insertBefore(2,3);

        testDLL.insertBefore(0,4);
        assertEquals( "Checking insertBefore to a list containing 3 elements at position 0", "4,1,2,3", testDLL.toString() );
        testDLL.insertBefore(1,5);
        assertEquals( "Checking insertBefore to a list containing 4 elements at position 1", "4,5,1,2,3", testDLL.toString() );
        testDLL.insertBefore(2,6);       
        assertEquals( "Checking insertBefore to a list containing 5 elements at position 2", "4,5,6,1,2,3", testDLL.toString() );
        testDLL.insertBefore(-1,7);        
        assertEquals( "Checking insertBefore to a list containing 6 elements at position -1 - expected the element at the head of the list", "7,4,5,6,1,2,3", testDLL.toString() );
        testDLL.insertBefore(7,8);        
        assertEquals( "Checking insertBefore to a list containing 7 elemenets at position 8 - expected the element at the tail of the list", "7,4,5,6,1,2,3,8", testDLL.toString() );
        testDLL.insertBefore(700,9);        
        assertEquals( "Checking insertBefore to a list containing 8 elements at position 700 - expected the element at the tail of the list", "7,4,5,6,1,2,3,8,9", testDLL.toString() );

        // test empty list
        testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(0,1);        
        assertEquals( "Checking insertBefore to an empty list at position 0 - expected the element at the head of the list", "1", testDLL.toString() );
        testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(10,1);        
        assertEquals( "Checking insertBefore to an empty list at position 10 - expected the element at the head of the list", "1", testDLL.toString() );
        testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(-10,1);        
        assertEquals( "Checking insertBefore to an empty list at position -10 - expected the element at the head of the list", "1", testDLL.toString() );
    }
    
    //TODO: use toString() function.
    /**
     * Check isEmpty() for both true & false outcomes.
     */
    @Test
    public void testIsEmpty() {
    	DoublyLinkedList<String> list = new DoublyLinkedList<String>();
    	assertTrue(list.isEmpty());
    	
    	list.push("str0");
    	assertFalse(list.isEmpty());
    }
    
    /**
     * Check if length() works.
     */
    @Test
    public void testLength() {
    	DoublyLinkedList<String> list = new DoublyLinkedList<String>();
    	int length=0;
    	assertEquals(length, list.length());
    	
    	length=1;
    	for (int i=0; i<length; i++) { 
    		list.push("str"+i); 
    	}
    	assertEquals(length, list.length());
    	
    	list = new DoublyLinkedList<String>();
    	length = 7;
    	for (int i=0; i<length; i++) {
    		list.push("str"+i);
    	}
    	assertEquals(length, list.length());
    	
    	list = new DoublyLinkedList<String>();
    	length = 1000;
    	for (int i=0; i<length; i++) {
    		list.push("str"+i);
    	}
    	assertEquals(length, list.length());
    }
     
    /**
     * Check get().
     */
    @Test
    public void testGet() {
    	DoublyLinkedList<String> list = new DoublyLinkedList<String>();
    	
    	assertEquals(null, list.get(0));
    	
    	for (int i=0; i<4; i++) {
    		list.push("str"+i);
    	}
    	
    	assertEquals(null, list.get(-1));
    	assertEquals("str0", list.get(0));
    	assertEquals("str1", list.get(1));
    	assertEquals("str2", list.get(2));
    	assertEquals("str3", list.get(3));
    	assertEquals(null, list.get(4));
    }
    
    /**
     * Check deleteAt() for first element, middle, last & only element.
     */
    @Test
    public void testDeleteAt() {
    	DoublyLinkedList<String> list = new DoublyLinkedList<String>();
    	for (int i=0; i<4; i++) {
    		list.push("str"+i);
    	}
    	
    	list.deleteAt(0); //delete head element in list of 4
    	assertEquals("str1", list.get(0));
    	assertEquals("str2", list.get(1));
    	assertEquals("str3", list.get(2));
    	assertEquals(null, list.get(3));
    	
    	assertFalse(list.deleteAt(-1));	//delete elements outside the list bounds
    	assertFalse(list.deleteAt(3));	//
    	
    	list.deleteAt(1); //delete centre element from list of 3
    	assertEquals("str1", list.get(0));
    	assertEquals("str3", list.get(1));
    	
    	list.deleteAt(1); //delete tail element from list of 2
    	assertEquals("str1", list.get(0));
    	assertEquals(null, list.get(1));
    	
    	list.deleteAt(0); //delete element 0 from list of 1
    	assertEquals(null, list.get(0));
    	
    	assertFalse(list.deleteAt(0)); //delete non-existent element 
    }
    
    /**
     * Check reverse() for list lengths of >2, 2 and 1.
     */
    @Test
    public void testReverse() {
    	//TODO:check head and tail are correct
    	//list length>2
    	DoublyLinkedList<String> list = new DoublyLinkedList<String>();
    	for (int i=0; i<4; i++) { 
    		list.push("str"+i);
    	}
    	assertEquals("str0", list.get(0));
    	assertEquals("str1", list.get(1));
    	assertEquals("str2", list.get(2));
    	assertEquals("str3", list.get(3));
    	list.reverse();
    	assertEquals("str3", list.get(0));
    	assertEquals("str2", list.get(1));
    	assertEquals("str1", list.get(2));
    	assertEquals("str0", list.get(3));
    	
    	//list length=2
    	list = new DoublyLinkedList<String>();
    	for (int i=0; i<2; i++) {
    		list.push("str"+i);
    	}
    	assertEquals("str0", list.get(0));
    	assertEquals("str1", list.get(1));
    	list.reverse();
    	assertEquals("str1", list.get(0));
    	assertEquals("str0", list.get(1));
    	
    	//list length=1
    	list = new DoublyLinkedList<String>();
    	for (int i=0; i<1; i++) {
    		list.push("str"+i);
    	}
    	assertEquals("str0", list.get(0));
    	list.reverse();
    	assertEquals("str0", list.get(0));
    	
    	//list length=0
    	list = new DoublyLinkedList<String>();
    	list.reverse();
    	assertEquals(null, list.get(0));
    }
    
    /**
     * Check push().
     */
    @Test
    public void testPush() {
    	DoublyLinkedList<String> list = new DoublyLinkedList<String>();
    	list.push("str0");
    	assertEquals("str0", list.get(0));
    	
    	list.push("str1");
    	assertEquals("str1", list.get(1));

    	list.push("str2");
    	assertEquals("str2", list.get(2));    	
    }
     
    /**
     * Check pop() for list lengths of >2, 2, 1, and 0. 
     */
    @Test
    public void testPop() {
    	DoublyLinkedList<String> list = new DoublyLinkedList<String>();
    	list.push("str0");
    	list.push("str1");
    	list.push("str2");
    	
    	assertEquals("str2", list.pop());
    	assertEquals("str1", list.pop());
    	assertEquals("str0", list.pop());
    	assertEquals(null, list.pop());
    }
     
    /**
     * Check dequeue() for lengths between 3 and 0.
     */
    @Test
    public void testDequeue() {
    	DoublyLinkedList<String> list = new DoublyLinkedList<String>();
    	list.push("str0");
    	list.push("str1");
    	list.push("str2");
    	
    	assertEquals("str0", list.dequeue());
    	assertEquals("str1", list.dequeue());
    	assertEquals("str2", list.dequeue());
    	assertEquals(null, list.dequeue());
    }
    
    /**
     * Check enqueue().
     */
    @Test
    public void testEnqueue() {
    	DoublyLinkedList<String> list = new DoublyLinkedList<String>();
    	list.enqueue("str0");
    	assertEquals("str0", list.get(0));
    	
    	list.enqueue("str1");
    	assertEquals("str1", list.get(1));

    	list.enqueue("str2");
    	assertEquals("str2", list.get(2));   
    }

}
