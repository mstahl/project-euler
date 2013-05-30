/*
 * Primes
 * 
 * A package for the rapid-as-hell sieving of prime numbers.
 */

package primes

func PrimesToLimit(limit int) *[]uint64 {
  sieve := make([]uint64, limit >> 6 + 1)
  // Initialize the sieve so that all numbers are marked prime
  for i, _ := range sieve {
    sieve[i] = 0xFFFFFFFFFFFFFFFF
  }
  // Starting with 2, sieve that shit hard
  for i := 2; i < limit; i++ {
    if q, r := i / 64, i % 64; sieve[q] & (1 << uint(r)) == 0 { continue }

    for j := 2 * i; j < limit; j += i {
      q, r := j / 64, j % 64
      sieve[q] = sieve[q] &^ (1 << uint(r))
    }
  }

  // Add the primes to a new slice and return that
  ps := make([]uint64, 0)
  for i := 2; i < limit; i++ {
    if q, r := i / 64, i % 64 ; sieve[q] & (1 << uint(r)) == 0 { continue }
    ps = append(ps, uint64(i))
  }

  return &ps
}
