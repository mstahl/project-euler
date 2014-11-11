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
#include <string.h>

#include <prime_factorization.h>

//--[ Prime numbers and friends ]----------------------------------------------
mpz_t * sieve_primes(uint64_t);
bool is_prime(uint64_t);

//--[ Useful numerical functions ]---------------------------------------------
uint64_t factorial_ui(uint64_t);
uint64_t gcd(uint64_t, uint64_t);
uint64_t lcm(uint64_t, uint64_t);
uint64_t isqrt(uint64_t);

uint64_t sigma(uint64_t, uint64_t);

//--[ Trivia ]-----------------------------------------------------------------
bool is_palindrome(uint64_t);
uint64_t reverse_digits(uint64_t);
uint64_t mpz_sum_of_digits(mpz_t);
bool is_perfect_square(uint64_t);

//--[ String functions ]-------------------------------------------------------
// char ** string_permutations(char *);

#endif
