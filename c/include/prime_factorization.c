#include "prime_factorization.h"

prime_factorization_t * prime_factors(uint64_t n) {
  // Sieve to n to get a bunch of prime numbers.
  mpz_t * primes = sieve_primes(n);
  prime_factorization_t * factorization = NULL;

  // For each prime number, divide n by it repeatedly to find the exponent and
  // also reduce the value of n at the same time.
  for(uint64_t p = 2; p <= n; ++p) {
    // Skip composites
    if(!mpz_tstbit(*primes, p)) continue;

    // Divide continuously by p to get the exponent for p. If n is not
    // divisible by p, the exponent remains zero.
    uint64_t exponent = 0;
    while(n % p == 0) {
      exponent++;
      n /= p;
    }

    if(exponent == 0) continue;

    // Allocate and create a new prime factorization list item, with the prime
    // and its exponent.
    prime_factorization_t * factor = (prime_factorization_t *)malloc(sizeof(prime_factorization_t));
    factor->prime = p;
    factor->exponent = exponent;
    factor->next = factorization;
    factorization = factor;
  }

  return factorization;
}

void prime_factorization_free(prime_factorization_t * factorization) {
  if(factorization == NULL) return;
  else {
    prime_factorization_free(factorization->next);
    free(factorization);
    return;
  }
}

void prime_factorization_print(prime_factorization_t * factorization) {
  while(factorization) {
    printf("%lu**%lu ", factorization->prime, factorization->exponent);
    factorization = factorization->next;
  }
  printf("\n");
}
