// C: Decodes a TIFF image file into a 1D byte array and prints this to the terminal

#include <stdio.h>
#include <tiffio.h>

int main(int argc, char *argv[]) {
	if (argc>1 && argc<=5) {
		
		
		for (int i=1; i<argc; i++){
			printf("[ %s ]\n", argv[i]);
			
		}
		
	}
	else {
		printf("Usage\n");
		printf("<program name> [1..4]<image_name.tiff>\n");
	}
		
	return 0;
}