/*
 * euler.h
 *
 * Standard Euler library.
 */

#ifndef EULER_H
#define EULER_H

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <math.h>

typedef unsigned long uint64;

uint64 gcd(uint64 u, uint64 v);
uint64 lcm(uint64 a, uint64 b);

bool is_prime(uint64 x);
bool is_palindrome(uint64 x);

uint64 * sieve_to_n(uint64 n);

/* Additional euler modules */
#include <sieve.h>

#endif
