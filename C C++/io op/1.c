//A program to learn the bas-ic io / op in C language.
//use ctype.h to enable converting string to lower case  
#include <stdio.h>
#include <ctype.h>

int main()
{
  int c;
  while((c = getchar()) != EOF)
    putchar(tolower(c));
  return 0;
}

//the [ tolower ] convert all string to lower case












