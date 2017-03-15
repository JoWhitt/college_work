/*************************************************************************
 *  Binary Search Tree class.
 *  Adapted from Sedgewick and Wayne.
 *
 *  @version 3.0 1/11/15 16:49:42
 *
 *  @author Joanna Whittam (15391524)
 *
 *************************************************************************/


public class BST<Key extends Comparable<Key>, Value> {
    public Node root;             // root of BST

    /**
     * Private node class.
     */
    public class Node {
        public Key key;           // sorted by key
        public Value val;         // associated data
        public Node left, right;  // left and right subtrees
        public int subtreeSize;   // number of nodes in subtree

        public Node(Key key, Value val, int N) {
            this.key = key;
            this.val = val;
            this.left = null;
            this.right = null;
            this.subtreeSize = N;
        }
    }

    // is the symbol table empty?
    public boolean isEmpty() { return size() == 0; }

    // return number of key-value pairs in BST
    public int size() { return size(root); }

    // return number of key-value pairs in BST rooted at x
    private int size(Node root) {
        if (root == null) return 0;
        else return root.subtreeSize;
    }

    /**
     *  Search BST for given key.
     *  Does there exist a key-value pair with given key?
     *
     *  @param key the search key
     *  @return true if key is found and false otherwise
     */
    public boolean contains(Key key) {
        return get(key) != null;
    }

    /**
     *  Search BST for given key.
     *  What is the value associated with given key?
     *
     *  @param key the search key
     *  @return value associated with the given key if found, or null if no such key exists.
     */
    public Value get(Key key) { return get(root, key); }

    private Value get(Node root, Key key) {
        if (root == null) return null;
        int cmp = key.compareTo(root.key);
        if      (cmp < 0) return get(root.left, key);
        else if (cmp > 0) return get(root.right, key);
        else              return root.val;
    }

    /**
     *  Insert key-value pair into BST.
     *  If key already exists, update with new value.
     *
     *  @param key the key to insert
     *  @param val the value associated with key
     */
    public void put(Key key, Value val) {
        if (val == null) { delete(key); return; }
        root = put(root, key, val);
    }

    private Node put(Node x, Key key, Value val) {
        if (x == null) return new Node(key, val, 1);
        int cmp = key.compareTo(x.key);
        if      (cmp < 0) x.left  = put(x.left,  key, val);
        else if (cmp > 0) x.right = put(x.right, key, val);
        else              x.val   = val;
        x.subtreeSize = 1 + size(x.left) + size(x.right);
        return x;
    }

//------------------------------------------------------------------------
    
    /**
     * Get tree height.
     *
     * Asymptotic worst-case running time using Theta notation: Theta(N)
     *
     * @return the number of links from the root to the deepest leaf.
     *
     * Example 1: for an empty tree this should return -1.
     * Example 2: for a tree with only one node it should return 0.
     * Example 3: for the following tree it should return 2.
     *   B
     *  / \
     * A   C
     *      \
     *       D
     */
    public int height() {
    	if (isEmpty())	return -1;
    	else			return height(root);
    }

    private int height(Node node) {
    	int height = 0;
    	if (node.left!=null)
    		height = 1+height(node.left);
    	if (node.right!=null) {
    		int rightHeight = 1+height(node.right);
    		if (height < rightHeight)
    			height = rightHeight;
    	}
    	return height;
    }
    
    /**
     * Median key.
     * If the tree has N keys k1 < k2 < k3 < ... < kN, then their median key 
     * is the element at position (N+1)/2 (where "/" here is integer division)
     *
     * @return the median key, or null if the tree is empty.
     */
    public Key median() {
      if (isEmpty()) return null;
      int medianIndex = (root.subtreeSize-1)/2;
      return median(root, medianIndex, size(root.left));
    }

    private Key median(Node root, int medianIndex, int currentIndex) {
    	if (currentIndex<medianIndex) {
    		int rightIndex = currentIndex+1+size(root.right.left);
    		return median(root.right, medianIndex, rightIndex);
    	}
    	if (currentIndex>medianIndex) {
    		int leftIndex = currentIndex-1-size(root.left.right);
    		return median(root.left, medianIndex, leftIndex);
    	}
    	return root.key;
    }

//PRINTING METHODS
    
    /**
     * Print all keys of the tree in a sequence, in-order.
     * That is, for each node, the keys in the left subtree should appear before the key in the node.
     * Also, for each node, the keys in the right subtree should appear before the key in the node.
     * For each subtree, its keys should appear within a parenthesis.
     *
     * Example 1: Empty tree -- output: "()"
     * Example 2: Tree containing only "A" -- output: "(()A())"
     * Example 3: Tree:
     *   B
     *  / \
     * A   C
     *      \
     *       D
     *
     * output: "((()A())B(()C(()D())))"
     *
     * output of example in the assignment: (((()A(()C()))E((()H(()M()))R()))S(()X()))
     *
     * @return a String with all keys in the tree, in order, parenthesised.
     */
    public String printKeysInOrder() {
      if (isEmpty())	return "()";
      else 				return printKeysInOrder(root);
    }
    
    private String printKeysInOrder(Node node) {
    	String toReturn = "";
    	toReturn = 	node.left!=null? "("+printKeysInOrder(node.left): "(()";
    	toReturn +=	node.key;
    	toReturn +=	node.right!=null? printKeysInOrder(node.right)+")": "())";
    	return toReturn;
    }
    
    /**
     * Pretty Printing the tree. Each node is on one line -- see assignment for details.
     *
     * @return a multi-line string with the pretty ascii picture of the tree.
     */
    public String prettyPrintKeys() {
    	if(isEmpty()) 	return "-null\n";
    	else			return prettyPrintKeys(root, "")+"\n";
    }

    private String prettyPrintKeys(Node node, String base){
    	String toReturn = "";
    	String leftBase = base+" |";
    	String rightBase = base+"  ";
    		
    	toReturn +="-"+node.key+"\n";
    
    	toReturn += leftBase + ( node.left==null? "-null": prettyPrintKeys(node.left, leftBase) ) + "\n";
    	toReturn += rightBase + ( node.right==null? "-null": prettyPrintKeys(node.right, rightBase) );
    	
    	return toReturn;
    }
 
//METHODS FOR MAX VALUES
    
    /**
     * Recursively finds & returns the Node with the maximum value in this tree.
     * 
     * @return Node with largest value in tree. 
     */
    public Node getMax() {
    	return getMax(root);
    }
    
    private Node getMax(Node root) {
    	if (root==null) return null;
    	if (root.right==null) return root;
    	return getMax(root.right);
    }
    
//DELETION
    
    /**
     * Deletes a key from a tree (if the key is in the tree).
     * Note that this method works symmetrically from the Hibbard deletion:
     * If the node to be deleted has two child nodes, then it needs to be
     * replaced with its predecessor (not its successor) node.
     *
     * @param key the key to delete
     */
    public void delete(Key key) {
    	root = delete(root, key);
    }

    private Node delete(Node node, Key key) {
	    if (node == null) return null;
	    
	    int cmp = key.compareTo(node.key);
	    if (cmp < 0) 		node.left = delete(node.left, key);
	    else if (cmp > 0) 	node.right = delete(node.right, key);
	    
	    else {
		    if (node.right == null) return node.left;
		    if (node.left == null) return node.right;
		    Node temp = node;
		    node = getMax(node.left);
		    node.left = delete(temp.left, getMax(temp.left).key);
		    node.right = temp.right;
	    }
	    node.subtreeSize = size(node.left) + size(node.right) + 1;
	    return node;
    }
}








