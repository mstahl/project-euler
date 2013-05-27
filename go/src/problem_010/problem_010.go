/*
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 * 
 * Find the sum of all the primes below two million.
 */

package main

import m "miller_rabin"

const limit = 2000000

func main() {
  sum := 0
  for i := 0; i < limit; i++ {
    if m.Test(i) {
      sum += i
    }
  }
  println(sum)
}
