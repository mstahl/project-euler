/*
 * Problem 117
 *
 * Using a combination of black square tiles and oblong tiles chosen from: red
 * tiles measuring two units, green tiles measuring three units, and blue tiles
 * measuring four units, it is possible to tile a row measuring five units in
 * length in exactly fifteen different ways.
 *
 * How many ways can a row measuring fifty units in length be tiled?
 *
 * NOTE: This is related to Problem 116.
 *
 * https://projecteuler.net/problem=117
 */

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

uint64_t a(uint64_t total_blocks) {
  uint64_t arrangements[total_blocks + 1];

  for(uint64_t w = 0; w <= total_blocks; ++w) {
    arrangements[w] = 0;

    // This solution is nearly identical to the solution to 116, but for the
    // addition of this loop, which simply iterates block size and thereby
    // tries to place each type of block, then adds up the total number of
    // possible arrangements.
    for(uint64_t bs = 2; bs <= 4; ++bs) {
      if(bs <= w) {
        for(uint64_t j = 0; j <= w - bs; ++j) {
          arrangements[w] += 1 + arrangements[j];
        }
      }
    }
  }

  uint64_t result = 1 + arrangements[total_blocks];

  return result;
}

int main(void) {
  printf("%lu\n", a(50));
}
