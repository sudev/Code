def func6(x, y):
	if x > y:
		return 1
	elif (x == y): 
		return 0 
	else:
		return -1;
x = int(raw_input("Enter x:"))
y = int(raw_input("Enter y"))
print func6(x,y)
