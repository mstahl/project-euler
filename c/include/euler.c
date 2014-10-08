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
uint64_t gcd(uint64_t u, uint64_t v) {
  uint64_t shift;

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
      uint64_t t = v; v = u; u = t;
    }  // Swap u and v.
    v = v - u;                       // Here v >= u.
  } while (v != 0);

  /* restore common factors of 2 */
  return u << shift;
}

uint64_t lcm(uint64_t a, uint64_t b) {
  return (a / gcd(a, b)) * b;
}

uint64_t isqrt(uint64_t n) {
  uint64_t x0 = 0;
  uint64_t x1 = n;

  while(x1 - x0 > 1) {
    x0 = x1;
    x1 = (x0 + n / x0) / 2;
  }
  return x1;
}

/*
 * Quirks about numbers
 */
bool is_palindrome(uint64_t x) {
  uint64_t reversed = reverse_digits(x);

  return reversed == x;
}

uint64_t reverse_digits(uint64_t n) {
  uint64_t result = 0;
  while(n > 0) {
    ldiv_t div_result = ldiv(n, 10);
    result *= 10;
    result += div_result.rem;
    n = div_result.quot;
  }
  return result;
}

/*
 * Primality
 */
bool is_prime(uint64_t x) {
  if(x == 1) { return false; }
  if((x & 1) == 0) { return false; }

  for(uint64_t d = 3; d < x / 2; d++) {
    if(x % d == 0) {
      return false;
    }
  }
  return true;
}
