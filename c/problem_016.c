/*
 * Problem 016
 *
 * × = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
 *
 * What is the sum of the digits of the number 2^1000?
 *
 * https://projecteuler.net/problem=16
 */

#include <euler.h>

int main(void) {
  mpz_t two;

  mpz_init_set_ui(two, 2);

  mpz_pow_ui(two, two, 1000);

  printf("%lu\n", mpz_sum_of_digits(two));
}
