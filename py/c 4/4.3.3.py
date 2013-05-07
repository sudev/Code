from swampy.TurtleWorld import *
def polygon(t,l,n):
    angle = 360.0 / float(n)
    print 'angle = ' + str(angle) + 'and no of sides = ' + str(n)
    for i in range(n):
        fd(t,l)
        lt(t, angle)
world = TurtleWorld()
bob = Turtle()
bob.delay =0.01
polygon(bob,25,20)
wait_for_user()
