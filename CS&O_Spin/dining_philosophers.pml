
int n_philosophers = 5;
bit forks[n_philosophers];

int eating_time = 1000000000;


proctype philosopher(int id) {
	lookForForks:
		do
		::(forks[id]==0) && (forks[(id+1)%n_philosophers]==0)->
			forks[id]==1;
			forks[(id+1)%n_philosophers]==1;
			goto eat;
		od;

	eat:
		int eating = eating_time;
		do 
		::(eating > 0) ->
			eating--;
		::else ->
			goto dropForks;
		od;

	dropForks:
		forks[id]==0;
		forks[(id+1)%n_philosophers]==0;
		goto lookForForks;
}

init {
	int i=0;
	do
	::(i <= n_philosophers) ->
		run philosopher(i);
		i++;
	od;
}

#https://github.com/oflynned/DiningPhilosophersPromela/blob/master/lab4.pml
