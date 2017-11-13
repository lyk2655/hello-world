#include<stdio.h>
#include"min.h"
#include"max.h"

int main()
{
	printf("hell0!\n");
	int maxN = max(5,8);
	int minM = min(6,4);
	printf("the max of 5 and 8 is: %d\n",maxN);
	printf("the min of 6 and 4 is: %d\n",minM);
	return 0;
}