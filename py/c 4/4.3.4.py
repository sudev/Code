import math
from swampy.TurtleWorld import *
def circler(turt, radius):
    steps = 100
    circum = 2.0 * math.pi * float(radius)
    length = float(circum) / float(steps)
    angle = 360.0 / 100.0
    print ' angle ::  ' + str(angle) + '   || no of sides = ' + str(steps) + '     | length =  ' + str(length)
    for i in range(steps):
        fd(turt,length)
        lt(turt, angle)
world = TurtleWorld()
bob = Turtle()
bob.delay =0.01
circler(bob,190)
wait_for_user()
