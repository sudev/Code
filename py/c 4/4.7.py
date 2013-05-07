import math
def arc(t, r, angle):
   arc_length = 2 * math.pi * r *angle / 360
   n = int(arc_length /3)  + 1
   step_length = arc_length / n
   step_angle = float(angle) / n
   polyline(t,n,step_lenght,step_anngle)
def polygon(t,n,length):
    angle = 360.0 / n
    polyline(t ,n , length ,angle)
def polyline(t,n,length):
    for i in range(n):
        fd(length,n)
        lt(t, angle)



