from swampy.TurtleWorld import *
def square(t,l):
    for i in range(4):
        fd(t,l)
        lt(t)
world = TurtleWorld()
bob = Turtle()
square(bob,0)
