/*
 * The following iterative sequence is defined for the set of positive
 * integers:
 *
 * n → n/2 (n is even)
 * n → 3n + 1 (n is odd)
 *
 * Using the rule above and starting with 13, we generate the following
 * sequence:
 *
 * 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
 *
 * It can be seen that this sequence (starting at 13 and finishing at 1)
 * contains 10 terms. Although it has not been proved yet (Collatz Problem), it
 * is thought that all starting numbers finish at 1.
 *
 * Which starting number, under one million, produces the longest chain?
 *
 * NOTE: Once the chain starts the terms are allowed to go above one million.
 *
 * https://projecteuler.net/problem=14
 */

#include <euler.h>

uint64_t collatz_length(uint64_t n) {
  if(n == 1) {
    return 1;
  }
  else if((n & 1) == 0) {
    return 1 + collatz_length(n / 2);
  }
  else {
    return 1 + collatz_length(3 * n + 1);
  }
}

int main(void) {
  uint64_t longest_length = 0;
  uint64_t longest_start  = 0;

  for(uint64_t i = 1; i < 1000000; ++i) {
    uint64_t i_length = collatz_length(i);
    if(i_length > longest_length) {
      longest_start = i;
      longest_length = i_length;
    }
  }
  printf("%lu", longest_start);
}

// Answer: 837799
