/*
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 * 
 * Find the sum of all the primes below two million.
 */

package main

import "fmt"

// const limit = 2000000
const limit = 100000

func sum(array []int) (s int) {
  for _, v := range array {
    s += v
  }
  return
}

func main() {
  sieve := new([limit - 2]int)
  for i := 2; i < limit; i++ {
    sieve[i - 2] = i
  }

  // Sieve of Eratosthenes
  for idx, val := range sieve {
    if val == 0 {
      continue
    }
    // fmt.Println("Sieving... ", val)

    for i := idx + 1; i < len(sieve); i++ {
      if sieve[i] % val == 0 {
        sieve[i] = 0
      }
    }
  }
  fmt.Println(sieve)
  fmt.Println(sum(sieve[0:]))
}
