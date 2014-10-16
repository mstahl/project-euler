/*
 * euler.h
 *
 * Standard Euler library.
 */

#ifndef EULER_H
#define EULER_H

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <math.h>
#include <gmp.h>

//--[ Prime numbers and friends ]----------------------------------------------
bool * sieve_primes(uint64_t);
bool is_prime(uint64_t);

//--[ Useful numerical functions ]---------------------------------------------
uint64_t gcd(uint64_t, uint64_t);
uint64_t lcm(uint64_t, uint64_t);
uint64_t isqrt(uint64_t);

//--[ Trivia ]-----------------------------------------------------------------
bool is_palindrome(uint64_t);
uint64_t reverse_digits(uint64_t);
uint64_t mpz_sum_of_digits(mpz_t);

#endif
