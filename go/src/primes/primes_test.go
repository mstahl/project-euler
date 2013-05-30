package primes

import "testing"
import "fmt"

var primesTo100 = []uint64{
  2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71,
  73, 79, 83, 89, 97,
}

func TestPrimesToLimit(t *testing.T) {
  ps := PrimesToLimit(100)
  if len(primesTo100) != len(*ps) {
    t.Fail()
  }
  for i, v := range *ps {
    if primesTo100[i] != v {
      fmt.Println("!!! => Expected ", primesTo100[i], ", got ", v)
      t.Fail()
    }
  }
}

func BenchmarkPrimesToLimit(b *testing.B) {
  _ = PrimesToLimit(100)
}
