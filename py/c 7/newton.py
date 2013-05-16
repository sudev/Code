def newton(a):
	x = 3.0
	while True:
		print x
		y = (x + (a/x)) / 2.0
		if abs(y-x) < 0.0001:
			break
		x = y
	print y

newton(int(raw_input("Enter a Number:\n")))