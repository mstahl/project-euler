#!/usr/bin/env ruby -wKU

# It turns out that 12 cm is the smallest length of wire that can be bent to form
# an integer sided right angle triangle in exactly one way, but there are many
# more examples.
# 
# 12 cm: (3,4,5)
# 24 cm: (6,8,10)
# 30 cm: (5,12,13)
# 36 cm: (9,12,15)
# 40 cm: (8,15,17)
# 48 cm: (12,16,20)
# 
# In contrast, some lengths of wire, like 20 cm, cannot be bent to form an
# integer sided right angle triangle, and other lengths allow more than one
# solution to be found; for example, using 120 cm it is possible to form exactly
# three different integer sided right angle triangles.
# 
# 120 cm: (30,40,50), (20,48,52), (24,45,51)
# 
# Given that L is the length of the wire, for how many values of L 1,500,000 can
# exactly one integer sided right angle triangle be formed?

require 'pp'

def triple(m, n)
  @a, @b, @c = [(m ** 2) - (n ** 2), 2 * m * n, (m ** 2) + (n ** 2)].sort
end

def perimeter(l)
  l.inject(0) {|s, x| s + x}
end


def multiples(triple, range)
  range.map do |t|
    t.map {|x| x * t}
  end
end

max = 1000

primitive_triples = []
(2..1414).each do |m|
  (1..(m-1)).each do |n|
    primitive_triples << triple(m, n)
  end
end
all_triples = []
primitive_triples.each do |p|
  (1..(max / p[2])).each do |m|
    all_triples << p.map {|side| side * m}
  end
end

# So all triples now contains a list of non-unique triangles.
all_triples.uniq!
# Now all the triangles are unique but some may have the same perimeter as 
# others.
all_triples_perimeters = all_triples.map do |l|
  perimeter(l)
end
unique_perimeters = all_triples_perimeters.uniq

count = 0
unique_perimeters.each do |p|
  if all_triples_perimeters.count(p) == 1 then
    count += 1
  end
end

p count