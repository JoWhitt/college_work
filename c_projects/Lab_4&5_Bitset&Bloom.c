//SP Lab 5: Bloom filters

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <math.h>

#define BLOOM_SIZE 8000

//----------------------------------------------------------------------------------
//FUNCTION DECLARATIONS
struct bitset;
struct bitset * bisetNew(int size);
int bitset_lookup(struct bitset * this, int item);
int bitset_add(struct bitset * this, int item);
int bitset_remove(struct bitset * this, int item);
void bitset_union(struct bitset * dest, struct bitset * src1, struct bitset * src2);
void bitset_intersect(struct bitset * dest, struct bitset * src1, struct bitset * src2);
void outputBitset(struct bitset * this);

struct bloom;
struct bloom * bloom_new(int size);
int bloom_lookup(struct bloom * this, char * item);
void bloom_add(struct bloom * this, char * item);
void bloom_union(struct bloom * dest, struct bloom * src1, struct bloom * src2);
void bloom_intersect(struct bloom * dest, struct bloom * src1, struct bloom * src2);

int hash1(char * item, int bloom_size);
int hash2(char * item, int bloom_size);

int bitset_main();
int bloom_main(int argc, char * argv[]);
int main(int argc, char * argv[]);

//----------------------------------------------------------------------------------
//STRUCT BITSET & ASSOCIATED FUNCTIONS

struct bitset {
	unsigned * array;
	int size;
	int byteSize;
};

/** create a new, empty bit vector set of 'size' items 
*/
struct bitset * bisetNew(int size) {
	//get size of set
	int byteSize = size/32;
	if (size%32 != 0)
		byteSize++;
	
	//allocate memory for set
	struct bitset * result;
	result = malloc(sizeof(struct bitset));
	result->array = malloc(byteSize*sizeof(unsigned));
	
	//set size
	result->size = size;
	result->byteSize = byteSize;
	
	//initialise set to empty
	for (int i=0; i<result->byteSize; i++) {
		result->array[i] = 0;
	}
	
	return result;
}

/** check to see if an item is in the set
	returns 1 if in the set, 0 if not, and -1 if 'item' is out of bounds
*/
int bitset_lookup(struct bitset * this, int item) {
	
	if (item>=this->size || item<0) {	// if item is out of bounds
		return -1;
	}
	else {								
		//get pos of item in bitset
		int byteIndex = item/32;
		int bitPos = item%32;
		
		//isolate item
		unsigned byte = this->array[byteIndex];
		return (byte>>bitPos) & 1;
	}
	
}

/**	add an item, with number 'item' to the set
	(returns 0 if item is out of bounds, 1 otherwise)
	has no effect if the item is already in the set
*/
int bitset_add(struct bitset * this, int item) {
	if (item>=this->size || item<0) {	// if item is out of bounds
		return 0;
	}
	else {
		//get pos of item in set
		int byteIndex = item/32;
		int bitPos = item%32;
		
		//set bit
		unsigned byte = this->array[byteIndex];
		byte = byte | (1<<bitPos);
		this->array[byteIndex] = byte;
		return 1;
	}
}

/**	remove an item with number 'item' from the set
	(returns 0 if item is out of bounds, 1 otherwise)
*/
int bitset_remove(struct bitset * this, int item) {
	if (item > this->size || item<0) {	// if item is out of bounds
		return 0;
	}
	else {
		//get pos of item in set
		int byteIndex = item/32;
		int bitPos = item%32;
		
		//set bit
		unsigned byte = this->array[byteIndex];
		byte = byte & ~(1<<bitPos);
		this->array[byteIndex] = byte;
		return 1;
	}
}

/**	place the union of src1 and src2 into dest
*/
void bitset_union(struct bitset * dest, struct bitset * src1, struct bitset * src2) {
	for(int i=0; i<dest->byteSize; i++) {
		dest->array[i] = src1->array[i] | src2->array[i];
	}
}

/**	place the intersection of src1 and src2 into dest
*/
void bitset_intersect(struct bitset * dest, struct bitset * src1, struct bitset * src2) {
	for(int i=0; i<dest->byteSize; i++) {
		dest->array[i] = src1->array[i] & src2->array[i];
	}
}

void outputBitset(struct bitset * this) {
	unsigned currentByte;
	int itemNumber = 0;
	
	for (int i=0; i<this->byteSize; i++) {
		currentByte = this->array[i];
		
		for (int j=0; j<32 && itemNumber<(this->size); j++){
			if ((currentByte&1) == 1) {
				printf("%c ", (unsigned char) itemNumber); }
			
			currentByte = currentByte>>1;
			itemNumber++;
		}
	}
	printf("\n");
}

//----------------------------------------------------------------------------------
//STRUCT BLOOM & ASSOCIATED FUNCTIONS

struct bloom {
	unsigned * array;
	int size;
	int byteSize;
};

/**	create a new, empty Bloom filter of 'size' items */
struct bloom * bloom_new(int size) {
	if (size>0) {
		//get size of set
		int byteSize = size/32;
		if (size%32 != 0)
			byteSize++;
		
		//allocate memory for set
		struct bloom * result;
		result = malloc(sizeof(struct bloom));
		result->array = malloc(byteSize*sizeof(unsigned));
		
		//set size
		result->size = size;
		result->byteSize = byteSize;
		
		//initialise set to empty
		for (int i=0; i<byteSize; i++) {
			result->array[i] = 0;
		}
		
		return result;
	}
	else return NULL;
	
}

/**	check to see if a string is in the set 
	( return 1 if string is included in set, 0 otherwise )	*/
int bloom_lookup(struct bloom * this, char * item) {	
	int to_return = 0;
	
	//get hash values
	int bit1 = hash1(item, this->size);
	int bit2 = hash2(item, this->size);
	
	//check bit1
	int byteIndex = bit1/32;
	int bitPos = bit1%32;
	unsigned byte = this->array[byteIndex];
	byte = byte>>bitPos;
	to_return = byte&1;
	
	if (to_return==1) {
		//check bit2
		byteIndex = bit2/32;
		bitPos = bit2%32;
		byte = this->array[byteIndex];
		byte = byte>>bitPos;
		to_return = byte&1;
	}
	
	return to_return;
}

/**	add a string to the set
	has no effect if the item is already in the set */
void bloom_add(struct bloom * this, char * item) {
	//get hash values
	int bit1 = hash1(item, this->size);
	int bit2 = hash2(item, this->size);
	
	//BIT1
	//find correct bit
	int byteIndex = bit1/32;
	int bitPos = bit1%32;
	//set bit
	unsigned byte = this->array[byteIndex];
	this->array[byteIndex] = byte|(1<<bitPos);
	
	//BIT2
	//find correct bit
	byteIndex = bit2/32;
	bitPos = bit2%32;
	//set bit
	byte = this->array[byteIndex];
	this->array[byteIndex] = byte|(1<<bitPos);
}

/**	place the union of src1 and src2 into dest */
void bloom_union(struct bloom * dest, struct bloom * src1, struct bloom * src2) {
	for(int i=0; i<dest->byteSize; i++) {
		dest->array[i] = src1->array[i] | src2->array[i];
	}
}

/**	place the intersection of src1 and src2 into dest */
void bloom_intersect(struct bloom * dest, struct bloom * src1, struct bloom * src2) {
	for(int i=0; i<dest->byteSize; i++) {
		dest->array[i] = src1->array[i] & src2->array[i];
	}
}

//----------------------------------------------------------------------------------
//HASHING FUNCTIONS

int hash1(char * item, int bloom_size) {
	int result = 0;
	for (int i=0; item[i]!='\0'; i++) {
		result += item[i] * 37 * (i+1);
	}
	return (result*(result/5))%bloom_size;
}

int hash2(char * item, int bloom_size) {
	
	int result = 1;
	for (int i=0; item[i]!='\0'; i++) {
		result *= item[i] + (i);
	}
	return (result)%bloom_size;
}

//----------------------------------------------------------------------------------
//MAIN FUNCTIONS

int bitset_main(){
	//initialise bitsets
	struct bitset * bitset1 = bisetNew(256);
	struct bitset * bitset2 = bisetNew(256);
	
	//read in strings
	const int MAX_STRING = 256;
	char buffer1[MAX_STRING];
	char buffer2[MAX_STRING];
	
	printf( "Enter a string: ");
	fgets(buffer1, MAX_STRING, stdin);
	printf( "Enter another string: ");
	fgets(buffer2, MAX_STRING, stdin);
	
	//place chars from strings into bitsets
	int returned;
	//bitset1
	for(int i=0; buffer1[i]!='\0'; i++) {
		returned = 0;
		while (returned!=1) { //ensures that the char is added successfully 
			returned = bitset_add(bitset1, buffer1[i]);
		}
	}
	//bitset2
	for(int i=0; buffer2[i]!='\0'; i++) {
		returned = 0;
		while (returned!=1) { //ensures that the char is added successfully
			returned = bitset_add(bitset2, buffer2[i]);
		}
	}
	
	// (1) The set of characters appearing in the first line
	printf("\nbitset1:");
	outputBitset(bitset1);
	
	// (2) the set of characters appearing in the second line
	printf("\nbitset2:");
	outputBitset(bitset2);
	
	// (3) the union of sets (1) and (2)
	printf("\nbitset1 union bitset2:");
	struct bitset * unionSet = bisetNew(256);
	bitset_union(unionSet, bitset1, bitset2);
	outputBitset(unionSet);
	
	// (4) the intersection of sets (1) and (2)
	printf("\nbitset1 intersection bitset2:");
	struct bitset * intersectSet = bisetNew(256);
	bitset_intersect(intersectSet, bitset1, bitset2);
	outputBitset(intersectSet);
	
	return 0;
}

int bloom_main(int argc, char * argv[]) {
	struct bloom * seen = bloom_new(BLOOM_SIZE);
	struct bloom * written = bloom_new(BLOOM_SIZE);
	char buffer[256];
	
	FILE * file1;
	FILE * file2;
	
	
	if( (file1=fopen(argv[2],"r")) == NULL )
		fprintf(stderr, "Cannot open file %s\n", argv[2]);
	else if ( (file2=fopen(argv[3],"r")) == NULL )
		fprintf(stderr, "Cannot open file %s\n", argv[3]);
	else {
		char c = fgetc(file1);
		while(!feof(file1)) {
			while ( (c==' ' || c=='\n' || c=='\t') && !feof(file1)) { //skip space characters, etc.
				c = fgetc(file1);
			}
			int i = 0;
			while (c!=' ' && c!='\n' && c!='\t' && !feof(file1)) { //read in word
				buffer[i] = c;
				c = fgetc(file1);
				i++;
			}
			buffer[i] = '\0';
			
			bloom_add(seen, buffer); //add word to "seen" bloom
		}
		
		c = fgetc(file2);
		while(!feof(file2)) {
			while ( (c==' ' || c=='\n' || c=='\t') && !feof(file2)) { //skip space characters, etc.
				c = fgetc(file2);
			}
			int i = 0;
			while (c!=' ' && c!='\n' && c!='\t' && !feof(file2)) { //read in word
				buffer[i] = c;
				c = fgetc(file2);
				i++;
			}
			buffer[i] = '\0';
			
			if ( (bloom_lookup(seen, buffer)==1) && (bloom_lookup(written, buffer)==0) ) {
				printf("\n%s", buffer);
				bloom_add(written, buffer);
			}
		}
	}
	
	return 0;
}

int main(int argc, char * argv[]) {//TODO: process parameters properly
	if (argc == 2) { 
		bitset_main();
	}
	else if (argc == 4) {
		bloom_main(argc, argv);
	}
	else {
		printf("Incorrect parameters. Try either of the following: \n\n");
		printf("<program_name> bitset\n");
		printf("<program_name> bloom <file_1> <file_2>\n");
	}
	
	return 0;
}
