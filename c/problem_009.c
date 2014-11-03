/*
 * Problem 009
 *
 * A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 *
 * a2 + b2 = c2
 * For example, 32 + 42 = 9 + 16 = 25 = 52.
 *
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 *
 * https://projecteuler.net/problem=9
 */

#include <euler.h>

int main(void) {
  uint64_t a, b, c;

  for(c = 3; c < 1000; ++c) {
    for(b = 2; b < c; ++b) {
      a = 1000 - c - b;
      if(a < 1) continue;
      if(a*a + b*b != c*c) continue;
      else {
        printf("%lu\n", a * b * c);
        return 0;
      }
    }
  }
}

// Answer: 31875000
