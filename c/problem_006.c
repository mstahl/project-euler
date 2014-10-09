/*
 * The sum of the squares of the first ten natural numbers is,
 * 
 * 1^2 + 2^2 + ... + 10^2 = 385 The square of the sum of the first ten natural
 * numbers is,
 * 
 * (1 + 2 + ... + 10)^2 = 55^2 = 3025 Hence the difference between the sum of the
 * squares of the first ten natural numbers and the square of the sum is 3025 −
 * 385 = 2640.
 * 
 * Find the difference between the sum of the squares of the first one hundred
 * natural numbers and the square of the sum.
 */

#include <euler.h>

#define MAXIMUM 100

uint64_t sum_of_squares_to_n(uint64_t n) {
  uint64_t sum = 0;
  // TODO There is a formula for this
  for(uint64_t i = 1; i <= n; ++i) {
    sum += i * i;
  }
  return sum;
}

uint64_t square_of_sum_to_n(uint64_t n) {
  uint64_t sum = 0;
  // TODO There is a formula for this
  for(uint64_t i = 1; i <= n; ++i) {
    sum += i;
  }
  return sum * sum;
}

int main(void) {
  printf("%llu\n", square_of_sum_to_n(MAXIMUM) - sum_of_squares_to_n(MAXIMUM));
}
