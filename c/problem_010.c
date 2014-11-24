/*
 * problem 10
 *
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * Find the sum of all the primes below two million.
 *
 * https://projecteuler.net/problem=10
 */

#include <euler.h>

#define MAX_PRIME 2000000

int main(void) {
  uint64_t sum = 0;
  mpz_t * prime_sieve = sieve_primes(MAX_PRIME);

  // Now that all the numbers have been sieved out, we can sum the entire sieve.
  for(int m = 2; m < MAX_PRIME; ++m) {
    if(mpz_tstbit(*prime_sieve, m)) sum += m;
  }
  printf("%lu\n", sum);
}

// Answer: 142913828922
