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

func test_inner(n, a, d, s int) bool {
  x := expmod(a, d, n)
  if x == 1 || x == n - 1 {
    return true
  }
  for r := 0; r < s - 1; r++ {
    x = (x * x) % n
    if x == 1 {
      return false
    }
    if x == n - 1 {
      return true
    }
  }
  return false
}

func Test(n int) bool {
  // Test super-small primes that are inconvenient to test for real.
  if n < 2 {
    return false
  }
  if n == 2 || n == 3 {
    return true
  }
  // Only test odd integers
  if n % 2 == 0 {
    return false
  }

  s, d := find_s_and_d(n)

  // if n < 1,373,653, it is enough to test a = 2 and 3;
  // if n < 9,080,191, it is enough to test a = 31 and 73;
  // if n < 4,759,123,141, it is enough to test a = 2, 7, and 61;
  // if n < 1,122,004,669,633, it is enough to test a = 2, 13, 23, and 1662803;
  // if n < 2,152,302,898,747, it is enough to test a = 2, 3, 5, 7, and 11;
  // if n < 3,474,749,660,383, it is enough to test a = 2, 3, 5, 7, 11, and 13;
  // if n < 341,550,071,728,321, it is enough to test a = 2, 3, 5, 7, 11, 13, and 17.

  witnesses := []int{}
  if n < 1373653 {
    witnesses = []int{ 2, 3 }
  } else if n < 9080191 {
    witnesses = []int{ 31, 73 }
  } else if n < 4759123141 {
    witnesses = []int{ 2, 7, 61 }
  } else if n < 1122004669633 {
    witnesses = []int{ 2, 13, 23, 1662803 }
  } else if n < 2152302898747 {
    witnesses = []int{ 2, 3, 5, 7, 11 }
  } else if n < 3474749660383 {
    witnesses = []int{ 2, 3, 5, 7, 11, 13 }
  } else if n < 341550071728321 {
    witnesses = []int{ 2, 3, 5, 7, 11, 13, 17 }
  } else {
    limit := min(n - 1, int(math.Floor(2 * math.Log(float64(n)) * math.Log(float64(n)))))

    for a := 2; a < limit; a++ {
      if !test_inner(n, a, d, s) {
        return false
      }
    }
    return true
  }

  for _, a := range witnesses {
    if !test_inner(n, a, d, s) {
      return false
    }
  }
  return true
}
