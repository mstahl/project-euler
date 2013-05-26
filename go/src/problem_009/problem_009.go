/*
 * A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
 * 
 * a^2 + b^2 = c^2 For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
 * 
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 */

package main

func is_pythagorean(a, b, c int) bool {
  return a * a + b * b == c * c
}

func main() {
  for c := 3; c < 997; c++ {
    for b := 2; b < 1000 - c; b++ {
      a := 1000 - b - c
      if is_pythagorean(a, b, c) {
        println(a * b * c)
        return
      }
    }
  }
}
