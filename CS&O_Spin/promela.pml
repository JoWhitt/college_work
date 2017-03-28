int n=0;

proctype p() {
	int count = 0;
	int temp;
	do
	:: count < 2 ->
		temp = n;
		temp++;
		n = temp;
		count++
	:: count >= 2 -> break
	od	
}

proctype q() {
	int count = 0;
	do
	:: count < 2 ->
		n = n+1;
		count++
	:: count >= 2 -> break
	od
}

init {
	run p();
	run q();
	_nr_pr == 1 -> assert(n==4)
}
