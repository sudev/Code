import math
def computeseries():
	t = (2.0 * math.sqrt(2)) / 9801
	term = 1.0
	k = 0
	sum = 0 
	c = 0.0000000000000000001
	while term > (c):
		print "c = " + str(c) 
		f = factorial(k)
		print "factorial" + str(f)
		num1 = (factorial(4*f))
		num2 = (1103.0 + 26390*k)
		dino = (f**4)*((396)**(4*k))
		term = (num1 / dino) * t 
		term = num2 * term
		print "term =" + str(term)
		sum = sum + term 
		k = k + 1
		print "sum=" + str(sum )
		print "k = " + str(k)
	print 1.0 / sum
def factorial(n):
	n = int(n)
	if n == 0:
		return 1
	else:
		return factorial(n-1)*n
#print factorial(raw_input())
print computeseries()