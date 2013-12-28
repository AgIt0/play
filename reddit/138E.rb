def distance(dx1, dx2, dy1, dy2)
  deltax = dx1 - dx2
  deltay = dy1 - dy2
  Math.sqrt(deltax * deltax + deltay * deltay)
end

def force(p1_mass, p2_mass, distance)
  (p1_mass * p2_mass) / distance**2
end
s = distance(-5.2, 8.7, 3.8, -4.1)
puts force(1, 1, s)
