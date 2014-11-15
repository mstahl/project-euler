/*
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

// sum = 124657
#define MAX 100000
/* #define MAX 1000000000000 */

bool is_progressive(uint64_t n) {
  for(uint64_t d = 2; d * d < n; ++d) {
    uint64_t q = n / d;
    uint64_t r = n % d;
    if((double)r/d == (double)d/q) return true;
  }
  return false;
}

int main(void) {
  uint64_t sum = 0;
  for(uint64_t m = 1; m * m < MAX; ++m) {
    if(is_progressive(m * m)) {
      sum += m * m;
    }
  }
  printf("%lu\n", sum);
}
