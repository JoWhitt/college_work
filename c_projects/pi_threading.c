//Pi Threading

#include <pthread.h> 
#include <stdio.h> 
#include <stdlib.h> 

#define NUM_THREADS 10
/*
void *PrintHello(void *threadid) { 
	printf("\n%d: Hello World!\n", threadid); 
	pthread_exit(NULL); 
} 

int main1 (int argc, const char * argv[]) { 
	pthread_t threads[NUM_THREADS];
	int rc,t; 
	for (t=0;t<NUM_THREADS;t++) { 
		printf("Creating thread %d\n",t); 
		rc = pthread_create(&threads[t],NULL,PrintHello,(void *)t); 
		if (rc) { 
			printf("ERROR return code from pthread_create(): %d\n",rc); 
			exit(-1); 
		} 
	} 
	// wait for threads to exit 
	for(t=0;t<NUM_THREADS;t++) { 
		pthread_join( threads[t], NULL); 
	} 
	return 0;
}*/

//-------------------------------------------------------------------------
 
void *get_pi_area_segment(void *threadid, double x1, double x2) { 
	printf("%d: segment %d->%d", threadid, x1, x2); 
	double area, y1, y2;
	y1 = Math.sqrt(1+ x1^2);
	y2 = Math.sqrt(1+ x2^2);
	area = ((y1+y2)/2) * (x1-x2);
	pthread_exit(NULL); 
}  
 
int main (int argc, char * argv[]) {
	pthread_t threads[NUM_THREADS];
	
	int i;
	double area_seg, x1, x2, width;
	width = 1/NUM_THREADS;
	x1 = 0;
	x2 = x1 + width;
	
	for (i=0; i<NUM_THREADS; i++) {
		printf("Creating thread %d\n",i); 
		area_seg= pthread_create(&threads[t],NULL,PrintHello,(void *)t, x1, x2);
		x1 = x2;
		x2 += width;
		if (!area_seg) { 
			printf("ERROR return code from pthread_create(): %d\n",area_seg); 
			exit(-1); 
		} 
	}
	
	// wait for threads to exit 
	for(i=0; i<NUM_THREADS; i++) { 
		pthread_join( threads[i], NULL); 
	} 
	return 0;
}