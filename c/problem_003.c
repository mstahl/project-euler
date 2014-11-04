/*
 * Problem 3
 *
 * The prime factors of 13195 are 5, 7, 13 and 29.
 *
 * What is the largest prime factor of the number 600,851,475,143?
 */

// TODO: This is not finished yet (obvs).

#include <euler.h>

const uint64_t n = 600851475143;
/* const uint64_t n = 13195; */

uint64_t largest_prime_factor(uint64_t x) {
  mpz_t * prime_sieve = sieve_primes(x);

  for(uint64_t i = x; i >= 2; --i) {
    if(!mpz_tstbit(*prime_sieve, i)) continue;

    if(x % i == 0) return i;
  }
  return x;
}

int main(int argc, char * argv[]) {
  printf("%lu\n", largest_prime_factor(n));
}
