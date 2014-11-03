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

#define MAX_PRIME 110000

int main(void) {
  bool * primes = sieve_primes(MAX_PRIME);
  int index = 0;
  int i;
  for(i = 0; i < MAX_PRIME; ++i) {
    if(primes[i]) index++;
    if(index == 10001) break;
  }
  printf("%d\n", i);
  free(primes);
}