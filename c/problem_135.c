/*
 * Problem 135
 *
 * Given the positive integers, x, y, and z, are consecutive terms of an
 * arithmetic progression, the least value of the positive integer, n, for
 * which the equation, x^2 − y^2 − z^2 = n, has exactly two solutions is
 * n = 27:
 *
 * 34^2 − 27^2 − 20^2 = 12^2 − 9^2 − 6^2 = 27
 *
 * It turns out that n = 1155 is the least value which has exactly ten
 * solutions.
 *
 * How many values of n less than one million have exactly ten distinct
 * solutions?
 *
 * https://projecteuler.net/problem=135
 */

#include <euler.h>

#define MAX 1000000

int main(void) {
  uint64_t * solution_counts = (uint64_t *)calloc(MAX + 1, sizeof(uint64_t));

  for(uint64_t u = 1; u <= MAX; ++u) {
    for(uint64_t v = 1; u * v <= MAX; ++v) {
      if((u + v) % 4 != 0) continue;
      if((3*v - u) % 4 != 0) continue;
      if(3 * v <= u) continue;

      solution_counts[u * v]++;
    }
  }

  uint64_t count = 0;
  for(int i = 1; i < MAX; ++i) {
    if(solution_counts[i] == 10) count++;
  }

  printf("%lu\n", count);
}
