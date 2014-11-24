/*
 * Problem 116
 *
 * A row of five black square tiles is to have a number of its tiles replaced
 * with coloured oblong tiles chosen from red (length two), green (length
 * three), or blue (length four).
 *
 * If red tiles are chosen there are exactly seven ways this can be done.
 *
 * If green tiles are chosen there are three ways.
 *
 * And if blue tiles are chosen there are two ways.
 *
 * Assuming that colours cannot be mixed there are 7 + 3 + 2 = 12 ways of
 * replacing the black tiles in a row measuring five units in length.
 *
 * How many different ways can the black tiles in a row measuring fifty units
 * in length be replaced if colours cannot be mixed and at least one coloured
 * tile must be used?
 *
 * NOTE: This is related to Problem 117.
 *
 * https://projecteuler.net/problem=116
 */

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

uint64_t a(uint64_t block_size, uint64_t total_blocks) {
  uint64_t arrangements[total_blocks + 1];

  for(uint64_t i = 0; i <= total_blocks; ++i) {
    if(block_size > i) {
      arrangements[i] = 0;
    }
    else {
      arrangements[i] = 0;
      for(uint64_t j = 0; j <= i - block_size; ++j) {
        arrangements[i] += 1 + arrangements[j];
      }
    }
  }

  uint64_t result = arrangements[total_blocks];

  return result;
}

int main(void) {
  printf("%lu\n", a(2, 50) + a(3, 50) + a(4, 50));
}
