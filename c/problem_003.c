/*
 * Problem 3
 *
 * The prime factors of 13195 are 5, 7, 13 and 29.
 *
 * What is the largest prime factor of the number 600851475143?
 */

// TODO: This is not finished yet (obvs).

#include <euler.h>

/* const long n = 600851475143; */
const long n = 13195;

uint64 largest_prime_factor(uint64 x) {
  for(uint64 i = 2; i < x; ++i) {
    uint64 q = x / i;
    printf("x = %lu, i = %lu, q = %lu\n", x, i, q);
    if(x % q == 0 && is_prime(q)) {
      return q;
    }
  }
  return x;
}

int main(int argc, char * argv[]) {
  printf("%lu", largest_prime_factor(n));
}
