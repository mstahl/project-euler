/*
 * Problem 092
 *
 * A number chain is created by continuously adding the square of the digits in
 * a number to form a new number until it has been seen before.
 *
 * For example,
 *
 * 44 → 32 → 13 → 10 → 1 → 1
 * 85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89
 *
 * Therefore any chain that arrives at 1 or 89 will become stuck in an endless
 * loop. What is most amazing is that EVERY starting number will eventually
 * arrive at 1 or 89.
 *
 * How many starting numbers below ten million will arrive at 89?
 *
 * https://projecteuler.net/problem=92
 */

#include <euler.h>

uint64_t sum_square_digits(uint64_t x) {
  uint64_t sum = 0;

  while(x > 0) {
    ldiv_t div_result = ldiv(x, 10);
    sum += div_result.rem * div_result.rem;
    x = div_result.quot;
  }

  return sum;
}

uint64_t convergent(uint64_t start) {
  while(start != 1 && start != 89) start = sum_square_digits(start);

  return start;
}

int main(void) {
  uint64_t count = 0;

  for(uint64_t n = 1; n < 10000000; ++n) {
    if(convergent(n) == 89) count++;
  }

  printf("%lu\n", count);
}

// Answer: 8581146
