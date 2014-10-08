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

uint64_t gcd(uint64_t, uint64_t);
uint64_t lcm(uint64_t, uint64_t);

uint64_t isqrt(uint64_t);

bool is_prime(uint64_t);
bool is_palindrome(uint64_t);

uint64_t reverse_digits(uint64_t);

/* Additional euler modules */
// #include <sieve.h>

#endif
