/*
 * Problem 009
 *
 * A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 *
 * a^2 + b^2 = c^2
 * For example, 3^2 + 4^2 = 9 + 16 = 25 = 52.
 *
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 *
 * https://projecteuler.net/problem=9
 */

#include <euler.h>

int main(void) {
  uint64_t a = 0, b = 0, c = 0;

  for(uint64_t m = 2;; ++m) {
    for(uint64_t n = 1; n < m; ++n) {
      a = m*m - n*n;
      b = 2*m*n;
      c = m*m + n*n;

      for(uint64_t k = 1; k*a + k*b + k*c <= 1000; ++k) {
        if(k*a + k*b + k*c == 1000) {
          printf("%llu\n", k*a*k*b*k*c);
          return 0;
        }
      }
    }
  }
}

// Answer: 31875000
