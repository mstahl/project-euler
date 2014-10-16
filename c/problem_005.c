/*
 * Problem 005
 *
 * 2520 is the smallest number that can be divided by each of the numbers from
 * 1 to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
 *
 * https://projecteuler.net/problem=5
 */

#include <stdint.h>
#include <stdio.h>

const uint64_t primes[8] = {2, 3, 5, 7, 11, 13, 17, 19};
const int num_primes = 8;

uint64_t lcm_to_limit(uint64_t limit) {
  uint64_t lcm = 1;

  for(int i = 0; i < num_primes; ++i) {
    uint64_t p = primes[i];
    uint64_t factor = p;

    while(factor * p < limit) {
      factor *= p;
    }
    lcm *= factor;
  }
  return lcm;
}

int main(void) {
  printf("%lu\n", lcm_to_limit(20));
}
