/*
 * sieve
 *
 * A Sieve of Eratosthenes that uses a shitload of memory.
 */

#include <euler.h>

uint64 * sieve_to_n(uint64 n) {
  // Allocate an array of n integers
  uint64 * sieve = (uint64*)calloc(n, sizeof(uint64));

  // Fill in the array
  for(uint64 i = 1; i <= n; ++i) {
    sieve[i - 1] = i;
  }

  // Iterate through the array, zeroing any entries that are divisible by any
  // previous (nonzero) entries.
  for(uint64 * p = sieve + 2; p < sieve + n; ++p) {
    for(uint64 * q = sieve + 1; q < p; ++q) {
      // If *q is nonzero, test to see if *p is divisible by *q. If it is, zero
      // it out.
      if(*q && (*p) % (*q) == 0) {
        *p = 0;
        break;
      }
    }
  }

  return sieve;
}
