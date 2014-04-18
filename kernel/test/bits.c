#include <stdio.h>
#define AT 002
#define MT 010
#define CT 004
/** First OR all the  bits to make iup 
 * later when you AND anything( AT / CT / MT ) with this it will return (AT / CT / MT)
 */

int main() { 
	char iup;
	iup = CT | MT | AT ;
	printf("AT | MT | CT %d",(int)iup);
	//iup is made up with OR'ing AT MT and CT 
	printf("AT & iup %d",(int)(iup & AT));
	// this will return AT 
	return 0;
}