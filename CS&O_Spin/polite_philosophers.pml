#define max_philosophers 5
#define maxTimeToStarvation 100

int forks[max_philosophers] = 0;
int phils_eating_now[max_philosophers] = 0;
int timeToStarvation[max_philosophers] = 0;
int phils_eating = 0;

//PHILOSOPHER---------------------------------------------------
proctype philosopher(int id) {
	think:
		atomic {
			timeToStarvation[id] = maxTimeToStarvation;
			do 
			::(forks[id]==0) -> 
				forks[id]=id;
				forks[(id+1)%max_philosophers]=id;
				phils_eating++;
				phils_eating_now[id] = 1;
				goto eat;
			::(timeToStarvation[id] <= 0) -> goto starve;
			::else -> timeToStarvation[id]--;
			od;
		};

	eat:
		atomic {
			phils_eating--;
			phils_eating_now[id] = 0;
		};
	
	putDownForks:
		atomic {
			forks[id]=0;
			forks[(id+1)%max_philosophers]=0;
			goto think;
		}
	starve:
}


//TABLE SETTINGS------------------------------------------------

proctype oneAtATable() {
	run philosopher(0);
}

proctype twoSittingApart() {
	run philosopher(0);
	run philosopher(2);
}

proctype twoSittingTogether() {
	run philosopher(1);
	run philosopher(2);
}

proctype fourPhilosophers() {
	atomic {
		int n_philosophers = 4;
		int i=0;
		do
		::(i < n_philosophers) ->
			run philosopher(i);
			i++;
		::else -> break;
		od;
	};
}

proctype fullTable() {
	atomic {
		int n_philosophers = 5;
		int i=0;
		do
		::(i < n_philosophers) ->
			run philosopher(i);
			i++;
		::else -> break;
		od;
	};
}

//--------------------------------------------------------------

init {
	run fullTable();
}


//spin -a dining_philosophers.pml; gcc -Wall pan.c; ./a.out
//https://github.com/oflynned/DiningPhilosophersPromela/blob/master/lab4.pml
