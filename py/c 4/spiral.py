import math
from swampy.TurtleWorld import *
def spiral(t,n,length = 3,a=0.1,b=0.0002):
    theta = 0
    for i in range(n):
        fd(t, length)
        dtheta = 1 / (a + b * theta)
        lt (t, dtheta)
        theta += dtheta*2
world = TurtleWorld()
bob = Turtle()
bob.delay = 0.01
spiral(bob,1000)

