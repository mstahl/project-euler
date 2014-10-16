/*
 * Problem 016
 *
 * × = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
 *
 * What is the sum of the digits of the number 2^1000?
 *
 * https://projecteuler.net/problem=16
 */

#include <stdint.h>
#include <stdio.h>
#include <gmp.h>

uint64_t mpz_sum_of_digits(mpz_t x) {
  uint64_t sum = 0;
  mpz_t remainder;

  mpz_init(remainder);

  while(mpz_cmp_ui(x,0) != 0) {
    sum += mpz_tdiv_qr_ui(x, remainder, x, 10);
  }
  return sum;
}

int main(void) {
  mpz_t two;

  mpz_init_set_ui(two, 2);

  mpz_pow_ui(two, two, 1000);

  printf("%lu\n", mpz_sum_of_digits(two));
}
