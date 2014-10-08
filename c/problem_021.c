/*
 * Problem 021
 *
 * Let d(n) be defined as the sum of proper divisors of n (numbers less than n
 * which divide evenly into n).  If d(a) = b and d(b) = a, where a ≠ b, then a
 * and b are an amicable pair and each of a and b are called amicable numbers.
 *
 * For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44,
 * 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4,
 * 71 and 142; so d(284) = 220.
 *
 * Evaluate the sum of all the amicable numbers under 10000.
 *
 * https://projecteuler.net/problem=21
 */

#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#define MAXIMUM 10000

uint64_t * sums_of_divisors;

uint64_t d(uint64_t n) {
  uint64_t sum = 0;
  for(uint64_t i = 1; 2 * i <= n; ++i) {
    if(n % i == 0) {
      sum += i;
    }
  }
  return sum;
}

bool is_amicable(uint64_t n) {
  return sums_of_divisors[n] != n && sums_of_divisors[sums_of_divisors[n]] == n;
}

int main(void) {
  uint64_t sum;

  // In order to build a table of sums of divisors, we'll follow a process
  // similar to sieving prime numbers. For every number i from 1 to 10000,
  // we'll skip over every i numbers and add i to the sum of divisors there.
  sums_of_divisors = (uint64_t *)calloc(MAXIMUM, sizeof(uint64_t));
  // First initialize all the buckets to one, obviating the first iteration
  // of the next loop.
  for(uint64_t i = 0; i < MAXIMUM; ++i) {
    sums_of_divisors[i] = 1;
  }
  // Now iterate through them to get divisors...
  for(uint64_t divisor = 2; divisor * 2 < MAXIMUM; ++divisor) {
    // Skip around the buckets, adding this divisor to all the buckets it
    // divides.
    for(uint64_t multiple = divisor * 2; multiple < MAXIMUM; multiple += divisor) {
      sums_of_divisors[multiple] += divisor;
    }
  }

  // Now we have a table that contains all the sums of divisors for all the
  // numbers 1 through MAXIMUM, which we can use to tell if numbers are
  // abundant or not.
  sum = 0;
  for(uint64_t j = 1; j < MAXIMUM; ++j) {
    if(sums_of_divisors[j] != j && sums_of_divisors[sums_of_divisors[j]] == j) {
      sum += j;
    }
  }
  printf("%llu\n", sum);

  return 0;
}
