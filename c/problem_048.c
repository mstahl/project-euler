/*
 * Problem 048
 *
 * The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
 *
 * Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
 *
 * https://projecteuler.net/problem=48
 */

#include <euler.h>

uint64_t exp_mod(uint64_t base, uint64_t exp, uint64_t mod) {
  uint64_t result = 1;

  for(uint64_t i = 0; i < exp; ++i) {
    result = (result * base) % mod;
  }

  return result;
}

int main(void) {
  uint64_t result = 0;

  for(uint64_t x = 1; x <= 1000; ++x) {
    result = (result + exp_mod(x, x, 10000000000)) % 10000000000;
  }

  printf("%lu\n", result);
}

// Answer: 9110846700
