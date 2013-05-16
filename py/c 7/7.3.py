import math
def newton(a):
	x = 3.0
	while True:
		y = (x + (a/x)) / 2.0
		if abs(y-x) < 0.0001:
			break
		x = y
	return y

for i in range(9):
	print str(i) + "\t",
	k = newton(i)
	l = math.sqrt(i)
	print str(l) + "\t",
	print str(k) + "\t",
	print abs(k - l )