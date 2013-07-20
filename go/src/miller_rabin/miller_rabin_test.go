package miller_rabin

import "testing"
import "fmt"

/*
 * Benchmark values:
 * 
 * Primes to 1,000,000:  78498
 * Primes to 10,000,000: 664579
 */

var primesTo100 = []uint64{
  2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71,
  73, 79, 83, 89, 97,
}

func TestTest(t *testing.T) {
  count := 0
  for i := 2; i < 1e7; i++ {
    if Test(i) {
      count++
    }
  }
  fmt.Println("!!! => Found ", count, " primes")
  if count != 664579 {
    t.Error("Wrong prime number count.")
  }
}

/*
 * func BenchmarkTest(b *testing.B) {
 * }
 */
