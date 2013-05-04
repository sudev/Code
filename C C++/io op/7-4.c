//How to scan something like 22 May 2012
#include <stdio.h>
int main ()
{
  int date,year;
  char monthname[20];
  //NO & is used in front of monthname since array name is a pointer 
  scanf("%d %s %d",&date,monthname,&year);
  printf("%s",monthname);
  printf("%d",date);
  return 0;
}
