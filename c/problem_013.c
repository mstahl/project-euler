/*
 * Problem 013
 *
 * Work out the first ten digits of the sum of the following one-hundred
 * 50-digit numbers.
 * 
 * [big list of numbers is in data/problem_013.h]
 *
 * https://projecteuler.net/problem=13
 */

#include <euler.h>
#include <data/problem_013.h>

int main(void) {
  mpz_t sum, operand;
  mpz_init(operand);
  mpz_init_set_ui(sum, 0);

  // Set operand to each big number in turn, adding each to the sum
  for(int i = 0; i < 100; ++i) {
    mpz_set_str(operand, big_numbers[i], 10);
    mpz_add(sum, sum, operand);
  }
  // Now divide by 10 until the number is only 10 digits
  while(mpz_sizeinbase(sum, 10) > 10) {
    mpz_tdiv_q_ui(sum, sum, 10);
  }
  // Done!
  mpz_out_str(stdout, 10, sum);
  printf("\n");
}

// Answer: 5537376230
