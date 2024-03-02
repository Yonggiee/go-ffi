#include <math.h>
#include <stdio.h>
#include <stdlib.h> 

void printPiJSON()
{
    printf("\"pi\":%f\n", M_PI);
    // int *p1 = malloc(1000000 * sizeof(int)); // does not seem to result in memory leak
}
