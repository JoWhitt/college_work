//Subtraction tree ADT

struct listnode {
	float value;
	long p;
};

struct list {
	struct listnode *head, *tail;
};


/* Returns a new empty list
*/
struct list * list_new() {
	struct list *new;
	
	new = malloc(sizeof(struct listnode));
	new->head = NULL;
	new->tail = NULL;
	
	return new;
}

/* Returns the sum of all values in the list
*/
float list_sum(struct list *this) {
	
}

/* Returns the value of the n'th item in the list
*/
float list_get(struct list *this, float val, int n) {
	
}

/* Return the n'th value from the end of the list
*/
float list_val_end(struct list *this, float val, int n) {
	
}

/* Remove all list elements == num
*/
void list_remove(struct list *this, float num) {
	
}

/* Insert value into the list. 
New val is inserted before element n.
If n>list.length val is added to the end.
*/
void list_insert(struct list *this, float val, int n) {
	struct listnode *new;
	new = malloc(sizeof(struct listnode));
	new->value = val;
	
	long last, current, next;
	last = 0;
	current = this->head;
	next = ((struct listnode *) current)->p;
	
	//iterate to position n in list
	for (int i=0; i<n && next!=0; i++) {
		last = current;
		current = next;
		next = ((struct listnode *) current)->p + last;
	}
	
	// insert new node
	if (i<n) { // insert at end of list
		last = current;
		current = 0;	
		new->p = current - last;
		((struct listnode *) last)->p = ((struct listnode *) last)->p + new;
		this->tail = new;
	}		
	else {
		new->p = current - last;
		((struct listnode *) current)->p = next - new;
		((struct listnode *) last)->p = ((struct listnode *) last)->p - current + new;
		if (n==0) //insert at start of list
			this->head = new;
	}	
}

/* Free memory of existing list
*/
void list_free(struct list *this) {
	
}






