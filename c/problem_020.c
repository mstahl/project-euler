/*
 * Problem 020
 *
 * n! means n × (n − 1) × ... × 3 × 2 × 1
 *
 * For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
 * and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 =
 * 27.
 *
 * Find the sum of the digits in the number 100!
 *
 * https://projecteuler.net/problem=20
 */

#include <euler.h>

void mpz_factorial_ui(mpz_t f, uint64_t n) {
  mpz_init_set_ui(f, 1);

  for(uint64_t x = 2; x <= n; ++x) {
    mpz_t mpx;
    mpz_init_set_ui(mpx, x);
    mpz_mul(f, f, mpx);
  }
}

int main(void) {
  mpz_t foo;
  mpz_init(foo);
  mpz_factorial_ui(foo, 100);
  printf("%lu\n", mpz_sum_of_digits(foo));
}

// Answer: 648
