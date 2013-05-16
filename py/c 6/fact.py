def fact(n):
	if not isinstance(n, int):
		print "Enter a fucking stuff of int type "
	elif n < 0 : 
		print "Please enter something greater than 0"
		return None 
	elif n == 0:
		return 1
	else:
		return n * fact(n-1)
print fact(2.23)