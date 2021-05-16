#include<stdio.h>

int main()
{
    for(int i = 0; i < 32; i++)
        printf("not not%d(OUT[%d], IN[%d]);\n",i,i,i);
    return 0;
}