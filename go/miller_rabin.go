/*
 * Miller-Rabin Primality test
 * 
 * (c) 2013 max thom stahl
 */

package miller_rabin

import "math"

func expmod(x, n, m int) (result int) {
  result = 1
  for ; n > 0 ; {
    if n % 2 == 1 {
      result = (result * x) % m
    }
    n = n >> 1
    x = (x * x) % m
  }

  return
}

func find_s_and_d(n int) (s, d int) {
  d = n - 1
  for d % 2 == 0 {
    s++
    d = d >> 1
  }
  return
}

func min(x, y int) int {
  if x > y {
    return x
  } else {
    return y
  }
}

func Test(n int) bool {
  // Only test odd integers
  if n % 2 == 0 {
    return false
  }
  // Test super-small primes that are inconvenient to test for real.
  if n < 2 {
    return false
  }
  if n == 2 || n == 3 {
    return true
  }
  s, d := find_s_and_d(n)
  limit := min(n - 1, int(math.Floor(2 * math.Log(float64(n)) * math.Log(float64(n)))))
  WitnessLoop: for a := 2; a < limit; a++ {
    x := expmod(a, d, n)
    if x == 1 || x == n - 1 {
      continue WitnessLoop
    }
    for r := 0; r < s - 1; r++ {
      x = (x * x) % n
      if x == 1 {
        return false
      }
      if x == n - 1 {
        continue WitnessLoop
      }
    }
    return false
  }
  return true
}
