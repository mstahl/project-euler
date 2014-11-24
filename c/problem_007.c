/*
 * Problem 007
 *
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
 * that the 6th prime is 13.
 *
 * What is the 10,001st prime number?
 *
 * https://projecteuler.net/problem=7
 */

#include <euler.h>

#define MAX_PRIME 105000

int main(void) {
  bool * primes = sieve_primes(MAX_PRIME);

  uint64_t i = 1;
  uint64_t p;
  for(p = 3; p < MAX_PRIME; p += 2) {
    if(primes[p]) ++i;
    if(i == 10001) break;
  }
  printf("%llu\n", p);
}

// Answer: 104743
