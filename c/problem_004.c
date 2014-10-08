/*
 * Problem 4
 *
 * A palindromic number reads the same both ways. The largest palindrome made
 * from the product of two 2-digit numbers is 9009 = 91 × 99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers.
 */

#include <euler.h>

int main(void) {
  long largest = 0;

  for(long x = 99999; x >= 10000; x--) {
    for(long y = 99999; y >= 10000; y--) {
      long product = x * y;
      if(product <= largest) { continue; }

      if(is_palindrome(product)) {
        printf("foo: %lu\n", product);
        largest = product;
      }
    }
  }
  printf("%ld\n", largest);

  return 0;
}
