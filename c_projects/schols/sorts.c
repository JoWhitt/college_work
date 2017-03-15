/* Program that reads in a text file of integers
   and outputs the numbers in sorted order. */

#include <stdio.h>
#include <stdlib.h>

/* find smallest element between start and end of array */
int findMin(int a[], int size, int start) {
  int min = a[start];
  int result = start;
  int i;

  for ( i = start; i < size; i++ ) {
    if ( a[i] < min ) {
      min = a[i];
      result = i;
    }
  }
  return result;
}

/* selection sort algorithm: repeatedly find smallest
   element and place at start of unsorted section. */
static int selectionSort(int a[], int size) {
	int smallest_int, smallest_idx; 
	int no_of_executions = 0;
	
	for(int i=0; i<size-1; i++) {
		smallest_int = a[i];
		smallest_idx = i;
		
		//iterate & find the smallest unsorted int
		for (int j=i+1; j<size; j++) {
			if (a[j]<smallest_int) {
				smallest_int = a[j];
				smallest_idx = j;
			}
			no_of_executions++;
		}
		
		//swap a[i] and the smallest unsorted int
		int temp = a[i];
		a[i] = smallest_int;
		a[smallest_idx] = temp;
	}
	return no_of_executions;
}

/* insertion sort algorithm: place unsorted array
   elements into the correct location in an initially
   empty sorted part.*/
int insertionSort(int a[], int size) {
	int no_of_executions = 0;
	
	for (int i=1; i<size; i++) {
		int j=i;
		while (a[j]<a[j-1] && j>0) {
			int temp = a[j];
			a[j] = a[j-1];
			a[j-1] = temp;
			j--;
			no_of_executions++;
		}
	}
	return no_of_executions;
}

/* bubble sort algorithm: repeatedly compare and swap
   adjacent array elements. */
int bubbleSort(int a[], int size) {
	int no_of_executions = 0;
	int last = size-1;
	
	while (last>1) {
		for (int i=0; i<last; i++) {
			if (a[i] > a[i+1]) {
				int temp = a[i];
				a[i] = a[i+1];
				a[i+1] = temp;
			}
			no_of_executions++;
		}
		last--;
	}
	return no_of_executions;
}

/* funny sort algorithm: like bubble sort only we
   go back to the start every time we find a pair
   out of order. */
int funnySort(int a[], int size) {
	int no_of_executions = 0;
	  int j, temp;

	  j = 0;
	  while ( j < size - 1 ) {
		if ( a[j] > a[j+1] ) {
		  temp = a[j];
		  a[j] = a[j+1];
		  a[j+1] = temp;
		  j = 0;
		}
		else {
		  j++;
		}
		no_of_executions++;
	  }
	return no_of_executions;
}

/* Open a file. Abort progam if file cannot be opened */
FILE * open_file(char filename[])
{
  FILE * file;

  file = fopen(filename, "r");
  if ( file == NULL ) {
    printf("FATAL: Error opening file %s. Aborting program.\n", filename);
    exit(1);
  }

  return file;
}

/* read a stream of up to 'size' integers from a text file.
   return number of integers */
int read_in(int a[], int size, char filename[])
{
  const int max_line = 1024;
  char line[max_line];
  int i;
  FILE * file;
  char * eof;

  file = open_file(filename);

  /* read in the ints - one per line */
  i = 0;
  eof = fgets(line, max_line, file);
  while ( eof != NULL && i < size ) {     /* eof == NULL => end of file */
    sscanf(line, "%d", &(a[i]));
    i++;
    eof = fgets(line, max_line, file);
  }
  fclose(file);
  return i;
}

/* write out an array of integers up to 'size' */
void write_out(int a[], int size)
{
  int i;

  for ( i = 0; i < size; i++ ) {
    printf("%d, ", a[i]);
  }
}


/* read in a file of numbers, sort them, and
   write them out to the screen */
int main()
{
  const int size = 1024;
  int nums[size];
  int nnums;

  //funny sort
  nnums = read_in(nums, size, "numbers.txt");
  printf("\nfunnySort: %d\n", funnySort(nums, nnums));
  write_out(nums, nnums);
  /* flush output buffer, so all output appears on screen */
  fflush(stdout);
  
  //selection sort
  nnums = read_in(nums, size, "numbers.txt");
  printf("\nselectionSort: %d\n", selectionSort(nums, nnums));
  write_out(nums, nnums);
  /* flush output buffer, so all output appears on screen */
  fflush(stdout);
  
  //insertion sort
  nnums = read_in(nums, size, "numbers.txt");
  printf("\ninsertionSort: %d\n", insertionSort(nums, nnums));
  write_out(nums, nnums);
  /* flush output buffer, so all output appears on screen */
  fflush(stdout);
  
  //bubble sort
  nnums = read_in(nums, size, "numbers.txt");
  printf("\nbubbleSort: %d\n", bubbleSort(nums, nnums));
  write_out(nums, nnums);
  /* flush output buffer, so all output appears on screen */
  fflush(stdout);

  return 0;
}