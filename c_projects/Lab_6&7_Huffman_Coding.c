// SP Lab 6&7 combined: Huffman Encoding & Decoding

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <math.h>
#include <string.h>

#define NUMBER_OF_CHARS 256

//--------------------------------------------------------------------
//BITFILE ------------------------------------------------------------
	
/** ADT file that allows 1 bit to be read/written 
*/
struct bitfile {
	FILE * file;
	unsigned char rbuffer;
	unsigned char wbuffer;
	int r_index;
	int w_index;
};

/** Create a new struct bitfile *
Open a new FILE of the given name to read / write to, depending on 
function parameter.
Initialise the buffers & indices
*/
struct bitfile * bitfile_open(char *filename, char *function) {
	struct bitfile *result;
	result = malloc(sizeof(struct bitfile));
	
	result->file = fopen(filename, function);
	assert(result->file != NULL);
	result->rbuffer = 0;
	result->wbuffer = 0;
	result->r_index = 0;
	result->w_index = 7;
	
	return result;
}

/** Read bit from bitfile 
Increment r_index each time and refill rbuffer as needed.
*/
int bitfile_read(struct bitfile * this) {
	int result;
	
	if (this->r_index==0) this->rbuffer = fgetc(this->file);
	result = (this->rbuffer<<this->r_index) & (1<<7);
	this->r_index  = (this->r_index+1)%8;
	
	return result;
}

/** Write bit to bitfile buffer
If buffer is full write buffer to file & reset buffer to 0.
Increments writing index accordingly.
*/
void bitfile_write(struct bitfile * this, int bit) {
	if((this->w_index) < 0) {
		fputc((this->wbuffer), (this->file));
		this->wbuffer = 0;
		this->w_index = 7;
	}
	
	this->wbuffer = this->wbuffer | bit<<(this->w_index);
	this->w_index--;
}

/** Close bitfile & free memory
Writes remaining buffer to file first.
*/
void bitfile_close(struct bitfile * this) {
	//finish writing to file
	if(this->w_index!=7) fputc((this->wbuffer), (this->file));
	
	fclose(this->file);
	free(this);
}

//--------------------------------------------------------------------
//HUFFMAN TREE -------------------------------------------------------

/** Node struct 
*/
struct node {
	int freq;
	unsigned char c;
	int is_compound;
	struct node * left;
	struct node * right;
};

/** Read each char of file and increment freq counts as appropriate.
Any count left as 0 is incremented to 1 for easier Huffman coding.
The training file is closed after counting the chars.
*/
void count_freqs(char *filename, int *freqs) {
	FILE *file;
	unsigned char c;
	
	//open file
	file = fopen(filename, "r");
	assert(file!=NULL);
	
	//initialise freqs
	for (int i=0; i<NUMBER_OF_CHARS; i++)
		freqs[i] = 0;
	
	//read in each char and increment counts accordingly
	c = fgetc(file);
	while (!feof(file)) {
		c = fgetc(file);
		freqs[c] += 1;
	}
	fclose(file);
	
	//increment any 0 counts to 1, for easier Huffman coding
	for (int i=0; i<NUMBER_OF_CHARS; i++) {
		if (freqs[i]==0)
			freqs[i] = 1;
	}
}

/** Iterate through nodes and find the lowest freq.
Remove this node from the list (without decrementing the size) and return it.
*/
struct node * remove_lowest_freq_from_list(struct node **nodes, int size) {
	int lowest_i = 0;
	int lowest_freq = nodes[0]->freq;
	
	//find lowest freq
	for (int i=0; i<size; i++) {
		if (nodes[i]->freq < lowest_freq ||
		   ( (nodes[i]->freq == lowest_freq) && (nodes[i]->c > nodes[lowest_i]->c) )){
			lowest_i = i;
			lowest_freq = nodes[i]->freq;
		}
	}
	
	//remove node from list
	struct node *result = nodes[lowest_i];
	nodes[lowest_i] = nodes[size-1];
	nodes[size-1] = NULL;
	
	return result;
}

/** Create a list of nodes for each char & freq and organise them into a tree
according to frequency.
The most frequent chars will be at the top of the tree and the least frequent at the bottom.
*/
struct node * build_huffnode_tree(int *freqs) {
	//initialise a node for each char
	struct node **nodes;
	nodes = malloc(NUMBER_OF_CHARS*sizeof(struct node *));
	
	for (int i=0; i<NUMBER_OF_CHARS; i++) {
		nodes[i] = malloc(sizeof(struct node));
		nodes[i]->freq = freqs[i];
		nodes[i]->c = (unsigned char) i;
		nodes[i]->is_compound = 0;
	}
	
	//until one root node remains:
	//repeatedly remove the 2 lowest freqs and create a compound node linking the 2
	//insert the compound node back into the list
	int size = NUMBER_OF_CHARS;
	struct node *lowest, *second;
	while(size>1) {
		lowest = remove_lowest_freq_from_list(nodes, size);
		size--;
		second = remove_lowest_freq_from_list(nodes, size);
		
		//create compound
		struct node *compound;
		compound = malloc(sizeof(struct node));
		compound->freq = (lowest->freq) + (second->freq);
		compound->c = (lowest->c > second->c)? lowest->c: second->c;
		compound->is_compound = 1;
		compound->left = lowest;
		compound->right = second;
		
		nodes[size-1] = compound;
	}
	return nodes[0];
}

/** Step recursively though the huffnode tree and compute encoding.
Encodings are outputted and added to the codes list.
Right steps add a 1 to the encoding, left steps add a 0.
Encodings are NULL terminated char arrays.
*/
void recursive_assign_encodings(struct node *root, char *encoding, char **codes) {
	
	if (root->is_compound == 0) {	//leaf node
		//copy encoding to list
		codes[root->c] = malloc(sizeof(encoding));
		int i=0;
		for (; i<strlen(encoding); i++) {
			codes[root->c][i] = encoding[i];
		}
		codes[root->c][i] = '\0';
		//printf(" %c:	%s\n", root->c, codes[root->c]);
	}
	else {	//compound node
		int i = strlen(encoding);
		
		//left (add a '0')
		encoding[i+1] = '\0';
		encoding[i] = '0';
		recursive_assign_encodings(root->left, encoding, codes);
		
		//right (add a '1')
		encoding[i+1] = '\0';
		encoding[i] = '1';
		recursive_assign_encodings(root->right, encoding, codes);
	}
}

/** Compute the frequency of each char in the file of the given name
and use these to build a tree of huffman nodes, with the most frequent
chars near the top and the least frequent near the bottom. 
Return the root of the tree.
*/
struct node * compute_huffman_tree(char *filename) {
	//initialise array of freqs to 0 & count frequency of chars
	int * freqs;
	freqs = malloc(NUMBER_OF_CHARS*sizeof(int));
	count_freqs(filename, freqs);
	
	//create huffman tree based on freqs
	struct node * root;
	root = malloc(sizeof(struct node));
	root = build_huffnode_tree(freqs);
	
	free(freqs);
	return root;
}

/** Iterate through each node of the given huffman tree and compute each encoding.
Copy these encodings into the array codes.
*/
void read_huffman_codes(struct node *root, char **codes) {
	//output each character & associated code
	char * encoding;
	encoding = malloc(NUMBER_OF_CHARS*sizeof(char));
	encoding[0] = '\0';
	recursive_assign_encodings(root, encoding, codes);
	free(encoding);
}

//--------------------------------------------------------------------
//HUFFMAN ENCODING ---------------------------------------------------

/** Iterate through file char by char writing each encoding into the new file.
The new file is opened as a struct bitfile.
*/
void encode_file(char *original_filename, char *encoded_filename, char **codes) {
	FILE *original_file;
	struct bitfile *encoded_file;
	char c;
	char *encoding;
	
	original_file = fopen(original_filename, "r");
	assert(original_file != NULL);
	encoded_file = bitfile_open(encoded_filename, "w");
	
	//encode each char
	while(1) {
		c = fgetc(original_file);
		if(feof(original_file)) { break; }
		
		encoding = codes[(int) c];
		for (int i=0; encoding[i]!='\0'; i++) {
			if (encoding[i]=='1') bitfile_write(encoded_file, 1);
			else bitfile_write(encoded_file, 0);
		}
	}
	
	bitfile_close(encoded_file);
	fclose(original_file);
	
}

/** Iterate through file bit by bit writing each decoded char into the new file.
The file to be decoded is opened as a struct bitfile.
*/
void decode_file(char *encoded_filename, char *decoded_filename, struct node *root) {
	struct bitfile * encoded_file;
	FILE * decoded_file;
	struct node * temp_root;
	int bit;
	
	encoded_file = bitfile_open(encoded_filename, "r");
	decoded_file = fopen(decoded_filename, "w");
	assert(decoded_file != NULL);
	temp_root = malloc(sizeof(struct node));
	
	//decode bits & write chars to new file
	while(1) {
		temp_root = root;
		
		while(temp_root->is_compound) {
			bit = bitfile_read(encoded_file);
			if (feof(encoded_file->file)) break;
			
			if (bit==0)	temp_root = temp_root->left;
			else		temp_root = temp_root->right;
		}
		if (feof(encoded_file->file)) break;
		
		fputc(temp_root->c, decoded_file);
	}
	
	bitfile_close(encoded_file);
	fclose(decoded_file);
}

//--------------------------------------------------------------------
//MAIN ---------------------------------------------------------------

/** Build Huffman tree and use it to compute codes for each char.
Encode file using these codes.
*/
void encoding(char *training_filename, char *filename_to_encode, char *encoded_filename) {
	char **codes;
	struct node *root;
	
	//get huffman codes
	codes = malloc(NUMBER_OF_CHARS*sizeof(char *));
	root = compute_huffman_tree(training_filename);
	read_huffman_codes(root, codes);
	
	//encode file
	encode_file(filename_to_encode, encoded_filename, codes);
}

/** Build Huffman tree and use it to decode the given file
*/
void decoding(char *training_filename, char *encoded_filename, char *decoded_filename) {
	struct node *root;
	root = compute_huffman_tree(training_filename);
	decode_file(encoded_filename, decoded_filename, root);
}

/** Prints program usage to stdout
*/
void output_program_usage() {
	printf("Usage:\n  a.exe encode <training filename> <input filename> <output filename>\n  a.exe decode <training filename> <input filename> <output filename>\n");
}

/** Main function
1) Compute Huffman codes using filename given.
2) Encode & output file
3) Decode & output file
*/
int main(int argc, char * argv[]) {
	if (argc!=5) output_program_usage();
	else if (strcmp(argv[1], "encode")==0)	encoding(argv[2], argv[3], argv[4]);
	else if (strcmp(argv[1], "decode")==0)	decoding(argv[2], argv[3], argv[4]);
	else output_program_usage();
	return 0;
}