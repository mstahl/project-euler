/*
 * The prime factors of 13195 are 5, 7, 13 and 29.
 * 
 * What is the largest prime factor of the number 600851475143?
 */

package main

import "fmt"
import "math"

// var n = 600851475143 uint64

func divisors_of(n uint64) (divisors []uint64) {
  divisors = make([]uint64, 0)
  max := uint64(math.Ceil(math.Sqrt(float64(n))))

  for i := uint64(1); i <= max; i++ {
    if n % i == 0 {
      divisors = append(divisors, i)
    }
  }

  return
}

func is_prime(n uint64) bool {
  for i := uint64(2); i < n; i++ {
    if n % i == 0 {
      return false
    }
  }
  return true
}

func prime_divisors_of(n uint64) (ps []uint64) {
  ps = make([]uint64, 0)
  divs := divisors_of(n)
  for _, v := range divs {
    if is_prime(v) {
      ps = append(ps, v)
    }
  }
  return
}

func main() {
  ps := prime_divisors_of(600851475143)
  fmt.Println(ps[len(ps) - 1])
}
