def printtwice(arg):
    print arg
    print arg
def calltwice(f,k):
    f(k)
    f(k)
def do_four(f,k):
    calltwice(f,k)
    calltwice(f,k)
do_four(printtwice,'Sudev ')
