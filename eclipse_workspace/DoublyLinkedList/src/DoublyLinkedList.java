//import java.util.Iterator;
//import java.util.ListIterator;
//import java.util.NoSuchElementException;

// -------------------------------------------------------------------------
/**
 *  This class contains the methods of Doubly Linked List.
 *
 *  @author  Joanna Whittam
 *  @version 19/10/16 14:54
 */


/**
 * Class DoublyLinkedList: implements a *generic* Doubly Linked List.
 * @param <T> This is a type parameter. T is used as a class name in the
 * definition of this class.
 *
 * When creating a new DoublyLinkedList, T should be instantiated with an
 * actual class name that extends the class Comparable.
 * Such classes include String and Integer.
 *
 * For example to create a new DoublyLinkedList class containing String data: 
 *    DoublyLinkedList<String> myStringList = new DoublyLinkedList<String>();
 *
 * The class offers a toString() method which returns a comma-separated sting of
 * all elements in the data structure.
 * 
 * This is a bare minimum class you would need to completely implement.
 * You can add additional methods to support your code. Each method will need
 * to be tested by your jUnit tests -- for simplicity in jUnit testing
 * introduce only public methods.
 */
class DoublyLinkedList<T extends Comparable<T>>
{

    /**
     * private class DLLNode: implements a *generic* Doubly Linked List node.
     */
    private class DLLNode
    {
        public final T data;
        public DLLNode next;
        public DLLNode prev;
    
        /**
         * Constructor
         * @param theData : data of type T, to be stored in the node
         * @param prevNode : the previous Node in the Doubly Linked List
         * @param nextNode : the next Node in the Doubly Linked List
         * @return DLLNode
         */
        public DLLNode(T theData, DLLNode prevNode, DLLNode nextNode) 
        {
          data = theData;
          prev = prevNode;
          next = nextNode;
        }
    }

    private DLLNode head, tail;

    /**
     * Constructor
     * @return DoublyLinkedList
     */
    public DoublyLinkedList() {
      head = null;
      tail = null;
    }

    /**
     * Tests if the doubly linked list is empty
     * @return true if list is empty, and false otherwise
     *
     * Worst-case asymptotic runtime cost: Theta(1)
     *
     * Justification:
     *  The number of operations performed in this function is a constant value.
     */ 
    public boolean isEmpty() {
    	return head==null && tail==null;
    }
    
    /**
     * Computes the length of the doubly linked list
     * @return Length of the list (no. of elements). Returns 0 if empty. 
     * 
     * Runtime: theta N
     * 
     * Justification: This function will run through every element of the list 
     * just once.
     */
    public int length() {
    	if (head==null)
    		return 0;
    	else {
    		int l=1;
	    	DLLNode node = head;
	    	while (node.next!=null) {
	    		l++;
	    		node=node.next;
	    	}
	    	return l;
    	}
    }

    /**
     * Inserts an element in the doubly linked list
     * @param pos : The integer location at which the new data should be
     *      inserted in the list. We assume that the first position in the list
     *      is 0 (zero). If pos is less than 0 then add to the head of the list.
     *      If pos is greater or equal to the size of the list then add the
     *      element at the end of the list.
     * @param data : The new data of class T that needs to be added to the list
     * @return none
     *
     * Worst-case asymptotic runtime cost: Theta(N)
     *
     * Justification:
     *  In the worst case scenario  
     */
    public void insertBefore( int pos, T data ) {
    	int l=length();
    	if (l==0 | pos>=l) {
    		push(data);
    	}
    	else if (pos<=0) {
    		DLLNode newNode = new DLLNode(data, null, head);
    		head.prev=newNode;
    		head=newNode;
    	}
    	else {
    		DLLNode next = head;
    		for(int i=0; i<pos; i++) next=next.next;
    		DLLNode newNode = new DLLNode(data, next.prev, next);
    		next.prev=newNode;
    		newNode.prev.next=newNode;
    	}
    }

    /**
     * Returns the data stored at a particular position
     * @param pos : the position
     * @return the data at pos, if pos is within the bounds of the list, and null otherwise.
     *
     * Worst-case asymptotic runtime cost: Theta(N)
     *
     * Justification:
     *  The worst case approximate run time is Theta(N) for the length() function on line 159 and the 
     *  the same again for the loop at line 162. Therefore the asymptotic runtime cost is Theta(N) also.
     *
     * Worst-case precise runtime cost:	N/A
     *
     * Justification: N/A
     * 
     */
    public T get(int pos) {
      int l=length();
      if (pos>=0 && pos<l) {
    	  	DLLNode wanted=head;
  			for (int i=0; i<pos; i++)
  				wanted=wanted.next;
  			return wanted.data;
      }
      else return null;
    }

    /**
     * Deletes the element of the list at position pos.
     * First element in the list has position 0. If pos points outside the
     * elements of the list then no modification happens to the list.
     * @param pos : the position to delete in the list.
     * @return true : on successful deletion, false : list has not been modified. 
     *
     * Worst-case asymptotic runtime cost: Theta(N)
     *
     * Justification:
     *  The length() function has an asymptotic runtime cost of Theta(N). In the worst case the function 
     *  will have to delete the second last element in the list. In this case the loop at line 204 will
     *  iterate through N-1 elements. Therefore the worst case asymptotic runtime cost of the function is
     *  Theta(N).
     */
    public boolean deleteAt(int pos) {
    	int l=length();
    	if (l==0) return false;
    	else if (l==1 && pos==0) {
    		head=null;
    		tail=null;
    		return true;
    	}
    	else if (pos==0) {
    		head=head.next;
    		head.prev=null;
    		return true;
    	}
    	else if (pos==l-1) { // i.e. pos==tail
    		tail=tail.prev;
    		tail.next=null;
    		return true;
    	}
    	else if (pos>0 && pos<l-1 && l>2) {
    		DLLNode delete=head;
    		for (int i=0; i<pos; i++)
    			delete=delete.next;
    		delete.next.prev=delete.prev;
    		delete.prev.next=delete.next;
    		return true;
    	}
    	else return false;
    }

    /**
     * Reverses the list.
     * If the list contains "A", "B", "C", "D" before the method is called
     * Then it should contain "D", "C", "B", "A" after it returns.
     *
     * Worst-case asymptotic runtime cost: Theta(N)
     *
     * Justification:
     *  In the worst case the the list will not be empty. In that case the while loop at line 229 will 
     *  iterate through all N elements. In this way the worst case asymptotic runtime cost of the function 
     *  is Theta(N).
     */
    public void reverse() {
    	if (!this.isEmpty()) {
    		DLLNode tmpPrev;
    		DLLNode newHead = tail;
    		while (head!=tail) {
    			tmpPrev = tail.prev;
    			tail.prev = tail.next;
    			tail.next = tmpPrev;
    			tail = tail.next;
    		}
    		head.prev=head.next;
    		head.next=null;
    		head = newHead;
    	}
    }


    /*----------------------- STACK */
    /**
     * This method should behave like the usual push method of a Stack ADT.
     * If only the push and pop methods are called the data structure should behave like a stack.
     * How exactly this will be represented in the Doubly Linked List is up to the programmer.
     * @param item : the item to push on the stack
     *
     * Worst-case asymptotic runtime cost: Theta(1)
     *
     * Justification:
     *  This function has a constant runtime cost.
     */
    public void push(T item) {
    	DLLNode node = new DLLNode(item, tail, null); 
    	if (this.isEmpty()) {
    		head = node;
    		tail = node;
    	}
    	else {
    		tail.next = node;
    		tail = node; 
    	}
    }

    /**
     * This method should behave like the usual pop method of a Stack ADT.
     * If only the push and pop methods are called the data structure should behave like a stack.
     * How exactly this will be represented in the Doubly Linked List is up to the programmer.
     * @return the last item inserted with a push; or null when the list is empty.
     *
     * Worst-case asymptotic runtime cost: Theta(1)
     *
     * Justification:
     *  This function has a constant runtime cost.
     */
    public T pop() {
      if (this.isEmpty()) {
    	  return null;
      }
      else if (length()==1) {
    	  T toReturn = head.data;
    	  head=null;
    	  tail=null;
    	  return toReturn;
      }
      else {
    	  T toReturn = tail.data;
    	  tail = tail.prev;
    	  tail.next = null;
    	  return toReturn;
      }
    }

    /*----------------------- QUEUE */
 
    /**
     * This method should behave like the usual enqueue method of a Queue ADT.
     * If only the enqueue and dequeue methods are called the data structure should behave like a FIFO queue.
     * How exactly this will be represented in the Doubly Linked List is up to the programmer.
     * @param item : the item to be enqueued to the stack
     *
     * Worst-case asymptotic runtime cost: Theta(1)
     *
     * Justification:
     *  This is the same running time as the push() function.
     */
    public void enqueue(T item) {
      push(item);
    }

     /**
     * This method should behave like the usual dequeue method of a Queue ADT.
     * If only the enqueue and dequeue methods are called the data structure should behave like a FIFO queue.
     * How exactly this will be represented in the Doubly Linked List is up to the programmer.
     * @return the earliest item inserted with a push; or null when the list is empty.
     *
     * Worst-case asymptotic runtime cost: Theta(1)
     *
     * Justification:
     *  This function has a constant runtime cost.
     */
    public T dequeue() {
    	if (this.isEmpty()) {
      	  return null;
        }
    	else if (length()==1) {
    		T toReturn = head.data;
	      	head = null;
	      	tail = null;
	      	return toReturn;
    	}
        else {
	      	T toReturn = head.data;
	      	head = head.next;
	      	head.prev = null;
	      	return toReturn;
        }
    }
 
    /*-----------------------*/
    /**
     * @return a string with the elements of the list as a comma-separated
     * list, from beginning to end
     *
     * Worst-case asymptotic runtime cost:   Theta(n)
     *
     * Justification:
     *  We know from the Java documentation that StringBuilder's append() method runs in Theta(1) 
     *  asymptotic time. We assume all other method calls here (e.g., the iterator methods above, and the 
     *  toString method) will execute in Theta(1) time. Thus, every one iteration of the for-loop will have 
     *  cost Theta(1). Suppose the doubly-linked list has 'n' elements. The for-loop will always iterate 
     *  over all n elements of the list, and therefore the total cost of this method will be n*Theta(1) = 
     *  Theta(n).
     */
    public String toString() {
      StringBuilder s = new StringBuilder();
      boolean isFirst = true; 

      // iterate over the list, starting from the head
      for (DLLNode iter=head; iter!=null; iter=iter.next)
      {
        if (!isFirst)
        {
          s.append(",");
        } else {
          isFirst = false;
        }
        s.append(iter.data.toString());
      }

      return s.toString();
    }

}


