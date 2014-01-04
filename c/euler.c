/*
 * euler.c
 *
 * Standard library of useful Project Euler related functions.
 */

#include "euler.h"

/*
 * Pure numerical functions
 */
// Shamelessly stolen from http://en.wikipedia.org/wiki/Binary_GCD_algorithm
uint64 gcd(uint64 u, uint64 v) {
  uint64 shift;

  /* GCD(0,v) == v; GCD(u,0) == u, GCD(0,0) == 0 */
  if (u == 0) return v;
  if (v == 0) return u;

  /* Let shift := lg K, where K is the greatest power of 2
     dividing both u and v. */
  for (shift = 0; ((u | v) & 1) == 0; ++shift) {
    u >>= 1;
    v >>= 1;
  }

  while ((u & 1) == 0)
    u >>= 1;

  /* From here on, u is always odd. */
  do {
    /* remove all factors of 2 in v -- they are not common */
    /*   note: v is not zero, so while will terminate */
    while ((v & 1) == 0)  /* Loop X */
      v >>= 1;

    /* Now u and v are both odd. Swap if necessary so u <= v,
       then set v = v - u (which is even). For bignums, the
       swapping is just pointer movement, and the subtraction
       can be done in-place. */
    if (u > v) {
      uint64 t = v; v = u; u = t;
    }  // Swap u and v.
    v = v - u;                       // Here v >= u.
  } while (v != 0);

  /* restore common factors of 2 */
  return u << shift;
}

uint64 lcm(uint64 a, uint64 b) {
  /* return (a * b) / gcd(a, b); */
  return (a / gcd(a, b)) * b;
}

/*
 * Quirks about numbers
 */
bool is_palindrome(uint64 x) {
  uint64 max_exp = floor(log10((double)x));
  uint64 reversed = 0;

  uint64 xx = x;
  for(uint64 exp = max_exp; exp > 0; exp--) {
    uint64 digit = xx % 10;
    xx = xx / 10;
    reversed = reversed * 10 + digit;
  }

  return reversed == x;
}

/*
 * Primality
 */
bool is_prime(uint64 x) {
  if(x == 1) { return false; }
  if((x & 1) == 0) { return false; }

  for(uint64 d = 3; d < x / 2; d++) {
    if(x % d == 0) {
      return false;
    }
  }
  return true;
}
