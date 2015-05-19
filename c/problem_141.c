/*
 * Investigating progressive numbers, n, which are also square
 *
 * Problem 141
 *
 * A positive integer, n, is divided by d and the quotient and remainder are q
 * and r respectively. In addition d, q, and r are consecutive positive integer
 * terms in a geometric sequence, but not necessarily in that order.
 *
 * For example, 58 divided by 6 has quotient 9 and remainder 4. It can also be
 * seen that 4, 6, 9 are consecutive terms in a geometric sequence (common
 * ratio 3/2).  We will call such numbers, n, progressive.
 *
 * Some progressive numbers, such as 9 and 10404 = 102^2, happen to also be
 * perfect squares.  The sum of all progressive perfect squares below one
 * hundred thousand is 124657.
 *
 * Find the sum of all progressive perfect squares below one trillion (10^12).
 *
 * https://projecteuler.net/problem=141
 */

#include <euler.h>

#define MAXIMUM ((uint64_t)1000000000000)

bool is_progressive(uint64_t n) {
  for(uint64_t d = 2; d * d < n; ++d) {
    uint64_t q = n / d;
    uint64_t r = n % d;

    if(d * d == r * q) {
      printf("%llu/%llu >- %llu : %llu : %llu\n", n, MAXIMUM, r, d, q);
      return true;
    }
  }
  return false;
}

int main() {
  uint64_t sum = 0;
  for(uint64_t i = 3; i * i < MAXIMUM; ++i) {
    if(is_progressive(i * i)) {
      sum += i * i;
    }
  }
  printf("%llu\n", sum);
}
