/* Program that reads in a simple mathematical equation and outputs result and an integer. */

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <math.h>

char acceptedOperators[] = {'+', '/', '*', '-', '^'};
const int noOfAcceptedOperators = 5;
const char acceptedDigits[] = {'0','1','2','3','4','5','6','7','8','9','.'};
const int noOfAcceptedDigits = 11;

typedef int bool;
#define true 1
#define false 0

//-----------------------------------------------------------------

//(UNUSED FUNCTION)
int tokenise(char str[], int start, char result[]) {
	int i=0;
	while (str[start]==' ') start++;
	while (str[start]!=' ' && str[start]!='\0') {
		result[i++]=str[start++];
	}
	result[i]='\0';
	if (start<256 && str[start]!='\0') return start;
	
	else 
		return -1;
}

//-----------------------------------------------------------------

int tokenise_ops(char str[], int start, char result[], char operators[]) {
	int i=0; //index in result
	//bool charIdentified;
	bool finished=false;
	while (str[start]==' ') start++; //skip any spaces
	
	int j=0;
	while (!finished && j<noOfAcceptedOperators) { //check for operator
		if (str[start]==operators[j]) {
			result[i++] = str[start++];
			finished = true;
		}
		j++;
	}
	
	while (!finished && str[start]!=' ' && str[start]!='\0') { //check for digit
		//confirm not operator has not been reached
		for (int j=0; !finished && j<noOfAcceptedOperators; j++) { 
			if (str[start]==operators[j]) {
				finished=true;
			}
		}
		if (!finished) {
			result[i++] = str[start++];
		}
	}
	
	result[i]='\0';
	if (start<256 && str[start]!='\0') 
		return start;
	else 
		return -1;
}

//-----------------------------------------------------------------

//Stack of doubles
struct node {
	double value;
	struct node * next;
};
struct stack {
	struct node * head;
};
struct stack * newEmptyStack() {
	struct stack * result;
	result = malloc(sizeof(struct stack));
	result->head=NULL;
	return result;
}
int isEmpty(struct stack * this) {
	return this->head == NULL;
}
void push(struct stack * this, double num) {
	struct node * newNode;
	newNode = malloc(sizeof(struct node));
	newNode->value = num;
	newNode->next = this->head;
	this->head = newNode;
}
double pop(struct stack * this) {
	struct node * temp;
	double result;
	assert (this->head != NULL);
	temp = this->head;
	this->head = this->head->next;
	result = temp->value;
	free(temp);
	return result;
}

//-----------------------------------------------------------------

void computeResult(struct stack * numStack, char operator) {
	double val2 = pop(numStack);
	double val1 = pop(numStack);
	double computedResult;
	printf("computing: %lf%c%lf\n", val1, operator, val2);
	switch(operator)
	{
	case '+':
		computedResult = val1+val2;
		break;
	case '-':
		computedResult = val1-val2;
		break;
	case '*':
		computedResult = val1*val2;
		break;
	case '/':
		computedResult = val1/val2;
		break;
	case '^':
		computedResult = pow(val1, val2);
		break;
	}
	printf("result: %lf\n", computedResult);
	push(numStack, computedResult);
}
//-----------------------------------------------------------------

int main() {
	const int MAX_STRING = 256;
	char buffer[MAX_STRING];

	printf( "Enter a postfix expression: ");
	fgets(buffer, MAX_STRING, stdin);

	char result[256];
	int start = 0;
	struct stack * numStack = newEmptyStack();
	
	while (start != -1) {
		start = tokenise_ops(buffer, start, result, acceptedOperators);
		printf("%s \n", result);
		
		bool operator=false;
		for (int j=0; !operator && j<noOfAcceptedOperators; j++) { 
			if (result[0]==acceptedOperators[j]) {
				operator=true;
				computeResult(numStack, result[0]);
			}
		}
		if (!operator && start!=-1) { //i.e. char is not an operator => is a number
			push(numStack, atof(result));
		}
	}
	
	double finalResult = pop(numStack);
	if (isEmpty(numStack))
		printf("final result: %lf\n", finalResult); //there was one double left on stack (perfect!)
	else 
		printf("Error in your postfix equation.\n"); //more than one double left on stack!
}
