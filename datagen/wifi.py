from math import sqrt
from random import uniform


class Person(object):

    """docstring for Person"""

    def __init__(self, x, y):
        # Cordinates of a person
        self.x = x
        self.y = y
        # State ; 1 = moving, 0 = still
        self.state = 0
        # Destination
        self.dest = {"x": x, "y": y}

    # Set destination
    def setDest(self, x, y):
        self.state = 1
        self.dest = (x, y)

    # Move a point
    def move(self):
        # Make sure he moves towards destination
        self.x = self.x
        self.y = self.y

    # Current position
    def pos(self):
        return {"x": self.x, "y": self.y}


def calculateSignal(person, rpi):
    # Let signal be a function of distance
    # So in a cartesian plane, use euclidean distance
    ppos = person.pos()
    rpos = rpi.pos()
    dis = sqrt(sum((ppos["x"] - rpos["x"]) ** 2, (ppos["y"] - rpos["y"]) ** 2))
    # Introducing some error between 85 to 100 random accuracy
    return dis * uniform(0.85, 1)
