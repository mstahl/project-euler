/*
 * Problem 050
 *
 * The prime 41, can be written as the sum of six consecutive primes:
 *
 * 41 = 2 + 3 + 5 + 7 + 11 + 13
 *
 * This is the longest sum of consecutive primes that adds to a prime below
 * one-hundred.
 *
 * The longest sum of consecutive primes below one-thousand that adds to a
 * prime, contains 21 terms, and is equal to 953.
 *
 * Which prime, below one-million, can be written as the sum of the most
 * consecutive primes?
 *
 * https://projecteuler.net/problem=50
 */

#include <euler.h>

/* #define MAXIMUM 10000 */
#define MAXIMUM 1000000

int main(void) {
  // First let's get all the primes below the maximum using a Sieve of
  // Eratosthenes.
  bool * sieve = sieve_primes(MAXIMUM);

  // Now we're gonna want the sum of all those primes. To make various
  // sums of consecutive primes, we'll subtract out primes at the edges.
  uint64_t sum = 0;
  uint64_t count = 0;
  for(uint64_t i = 2; i <= MAXIMUM; ++i) {
    if(sieve[i]) {
      sum += i;
      count++;
    }
  }

  // We will start chipping away at the sum, breaking off primes to the left
  // and the right, to make progressively smaller and smaller sequences, until
  // we find one that's prime. We're keeping the original prime sieve around
  // because it now doubles as an O(n) primality test.
  for(int num_to_discard = 1; num_to_discard < count; ++num_to_discard) {
    // Now iterate over this number of primes to discard, discarding from the
    // left and then from the right so that the total discarded is always
    // num_to_discard.
    for(int discard_left = 0; discard_left <= num_to_discard; ++discard_left) {
      // num_to_discard = discard_right + discard_left
      int discard_right = num_to_discard - discard_left;
      // Copy the sum into a new variable so we can subtract numbers from it
      uint64_t new_sum = sum;

      // Now iterate up along the left side, subtracting out primes until we
      // have subtracted discard_left of them.
      int num_discarded = 0;
      for(int i = 0; num_discarded < discard_left && i < MAXIMUM; ++i) {
        if(sieve[i]) {
          new_sum -= i;
          num_discarded++;
        }
      }
      // Then do the same thing on the right
      num_discarded = 0;
      for(int i = MAXIMUM; num_discarded < discard_right && i >= 0; --i) {
        if(sieve[i]) {
          new_sum -= i;
          num_discarded++;
        }
      }
      // We should definitely skip this combination of numbers if the new sum
      // is greater than our maximum, since that's hardly useful.
      if(new_sum > MAXIMUM) {
        continue;
      }
      // If new_sum is prime, we won!
      if(sieve[new_sum]) {
        free(sieve);
        printf("%lu\n", new_sum);
        return 0;
      }
    }
  }
  free(sieve);
  return -1;
}
