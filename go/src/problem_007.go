/*
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
 * that the 6th prime is 13.
 * 
 * What is the 10,001st prime number?
 */

package main

import "miller_rabin"

func main() {
  primes_found, p := 1, 0
  for i := 1; primes_found < 10001; i += 2 {
    if miller_rabin.Test(i) {
      primes_found++
      p = i
    }
  }
  println(p)
}
