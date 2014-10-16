/*
 * problem 10
 *
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * Find the sum of all the primes below two million.
 *
 * https://projecteuler.net/problem=10
 */

#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

#define MAX_PRIME 2000000

int main(void) {
  uint64_t sum = 0;
  uint32_t * sieve = (uint32_t *)calloc(MAX_PRIME, sizeof(uint32_t));

  // Initialize sieve
  for(int i = 0; i < MAX_PRIME; ++i) {
    sieve[i] = i;
  }

  // Zero out 0, 1
  sieve[0] = sieve[1] = 0;

  // Perform sieving starting with 2
  for(int j = 2; j * 2 < MAX_PRIME; ++j) {
    // Skip this index if it's already been zeroed, as any multiples of this
    // index would also be multiples of whichever index sieved this index out,
    // thus assuring it can't be prime. All the multiples of this index would
    // already have been zeroed out.
    if(sieve[j] == 0) continue;

    // If not, let's start with this index and cross out every multiple of j.
    for(int k = j * 2; k < MAX_PRIME; k += j) {
      sieve[k] = 0;
    }
  }

  // Now that all the numbers have been sieved out, we can sum the entire sieve.
  for(int m = 0; m < MAX_PRIME; ++m) {
    sum += sieve[m];
  }
  printf("%lu\n", sum);

  free(sieve);
}
