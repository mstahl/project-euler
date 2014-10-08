/*
 * sieve
 *
 * A Sieve of Eratosthenes that uses a shitload of memory.
 */

#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

#include "bitfield.h"

bitfield_t * sieve_to_n(uint64_t n) {
  bitfield_t * bits = bitfield_create(n + 1);
  bitfield_set_all(bits);

  // 0 and 1 are not prime, so clear them (these are wasted bits; wahhh)
  bitfield_clear(bits, 0);
  bitfield_clear(bits, 1);

  for(int i = 2; i * 2 <= n; ++i) {
    // Skip this number if its entry is zero
    if(!bitfield_query(bits, i)) { continue; }

    // Zero out every i numbers
    for(int j = i + i; j <= n; j += i) {
      printf("i = %d, j = %d; crossing out %d\n", i, j, j);
      bitfield_clear(bits, j);
    }
  }

  return bits;
}

// Main method for testing this module
int main(int argc, char * argv[]) {
  uint64_t number_of_primes;

  printf("argc = %d, argv[0] = %s\n", argc, argv[0]);

  if(argc > 1) {
    sscanf(argv[1], "%llu", &number_of_primes);
  }
  else {
    number_of_primes = 100;
  }

  bitfield_t * primes = sieve_to_n(number_of_primes);

  printf("DEBUG: bitfield contents: %llu\n", primes->storage[0]);

  for(int k = 2; k < number_of_primes; ++k) {
    if(bitfield_query(primes, k)) {
      printf("%d is prime\n", k);
    }
  }

  printf("\nThere are %llu prime numbers below %llu\n", bitfield_count(primes), number_of_primes);

  free(primes);
}

/******************************************************************************
uint64_t * sieve_to_n(uint64_t n) {
  // Allocate an array of n integers
  uint64_t * sieve = (uint64_t*)calloc(n, sizeof(uint64_t));

  // Initialize the sieve with all the numbers 1 through n
  for(int i = 1; i <= n; ++i) {
    sieve[i - 1] = i;
  }

  // Now, starting with i = two, then three, zero out every i^th number.
  for(int i = 2; i * 2 <= n; ++i) {
    // Skip this number if its entry is zero
    if(sieve[i - 1] == 0) { continue; }

    // Zero out every i numbers
    for(int j = i + i; j < n; j += i) {
      sieve[j - 1] = 0;
    }
  }

  return sieve;
}

// Main method for testing this module
int main(void) {
  uint64_t * primes = sieve_to_n(SIZE);
  uint64_t prime_count = 0;

  for(uint64_t i = 3; i < SIZE; ++i) {
    if(primes[i - 1] != 0) {
      prime_count++;
    }
  }
  printf("\nThere are %llu prime numbers below %d\n", prime_count, SIZE);

  free(primes);
}
******************************************************************************/
