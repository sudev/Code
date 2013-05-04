//intro to FILE 
//FILE included in <stdio.h>

#include <stdio.h>
void printtoscreen(FILE *,FILE *);
int main(int argc, char *argv[]){
  FILE *fp;
  //define a file pointer fp 
  if (argc == 1)
    printf("give me something to read");
  else
    while(--argc > 0)
      //repeats the loop for each character  
      if((fp = fopen(*++argv, "r")) == NULL)
	return 1;
      else
	{
	  printtoscreen(fp, stdout);
	  fclose(fp);
	}

  return 0;

}

/*funciton to print out stuff from the given file */
void printtoscreen(FILE *fip, FILE *opf)
{
  int c;
  while((c= getc(fip)) != EOF)
    putc(c,opf);
    
}

