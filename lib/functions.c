#include "functions.h"
#include <stdio.h>

double absolute(double val)
{
	if(val<0) return -val;
	else return val;
}

double CtoF(double val) // convert celsius to fahrenheit
{
	return val*9/5+32;
}

double FtoC(double val) // convert fahrenheit to celcius
{
	return (val-32)*5/9;
}

void printFib(int n)
{
	int val1=0;
	int val2=1;
	int mem=0;
	printf("First %d Fibonacci numbers: ",n);
	for(int i=0;i<n;i++)
	{
		printf("%d ",val1);
		mem=val1;
		val1=val2;
		val2=mem+val1;
	}
	printf("\n");
}
