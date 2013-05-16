def istriangle(a,b,c):
    if (a > (b + c)):
        print "not "
    elif ( b > a + c):
        print "Not "
    elif ( c > a + b):
        print "not "
    else:
        print "okay deal"

a = int(raw_input("Enter a:"))
b = int(raw_input("Enter b:"))
c = int(raw_input("Enter c:"))

istriangle(a,2,3)
