import math
def hypo(a,b):
	# a**2 + b**2 = c**2
	return math.sqrt((a**2 + b**2))
print hypo(float(raw_input("Enter A:")),float(raw_input("Enter B:")))