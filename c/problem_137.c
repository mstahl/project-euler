/*
 * Problem 137
 *
 * Consider the infinite polynomial series AF(x) = xF1 + x2F2 + x3F3 + ...,
 * where Fk is the kth term in the Fibonacci sequence: 1, 1, 2, 3, 5, 8, ... ;
 * that is, Fk = Fk−1 + Fk−2, F1 = 1 and F2 = 1.
 *
 * For this problem we shall be interested in values of x for which AF(x) is a
 * positive integer.
 *
 * Surprisingly AF(1/2)AF =   (1/2).1 + (1/2)2.1 + (1/2)3.2 + (1/2)4.3 +
 * (1/2)5.5 + ...
 *     =  1/2 + 1/4 + 2/8 + 3/16 + 5/32 + ...
 *     =  2
 * The corresponding values of x for the first five natural numbers are shown
 * below.
 *
 * x3F3AF(x)
 * √2−161
 * 1/22
 * (√13−2)/323
 * (√89−5)/894
 * (√34−3)/55
 *
 * We shall call AF(x) a golden nugget if x is rational, because they become increasingly rarer; for example, the 10th golden nugget is 74049690.
 *
 * Find the 15th golden nugget.B
 */

#include <euler.h>

// The generating function for Fibonacci numbers, gleaned from the Wikipedia,
// is:
//
//               x
// Af(x) = -------------
//          1 - x - x^2
// 
// Solving for x gets us a ridiculous quadratic but the upshot is that x will
// be rational if and only if the *determinent*, the part under the radical in
// the quadratic equation, is a perfect square. So we can get away with just
// extracting that one part:
//
//   5*N^2 + 2*N + 1
//
// Where N = Af(x). So we just need to iterate over N and check each one for
// the value of this polynomial.
//
// This method craps out after the 11th golden nugget, but an interesting
// pattern emerges: each golden nugget number is the product of two consecutive
// Fibonacci numbers. This means it's actually surprisingly trivial to calculate
// them.

int main(void) {
  uint64_t gold_nugget_count = 0;
  uint64_t f0 = 1;
  uint64_t f1 = 1;
  uint64_t i = 0;

  while(gold_nugget_count < 15) {
    uint64_t f2 = f0 + f1;
    f0 = f1;
    f1 = f2;
    ++i;

    if(i & 1) {
      gold_nugget_count++;
      printf("gold nugget #%lu = %lu\n", gold_nugget_count, f0 * f1);
    }
  }

  printf("Done!\n");
}
