#ifndef PRIME_FACTORIZATION_H
#define PRIME_FACTORIZATION_H

#include "euler.h"

typedef struct prime_factor {
  uint64_t prime;
  uint64_t exponent;
  struct prime_factorization * next;
} prime_factorization_t;

prime_factorization_t * prime_factors(uint64_t);
void prime_factorization_print(prime_factorization_t *);
void prime_factorization_free(prime_factorization_t *);

#endif /* PRIME_FACTORIZATION_H */
