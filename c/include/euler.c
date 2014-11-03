/*
 * euler.c
 *
 * Standard library of useful Project Euler related functions.
 */

#include "euler.h"

mpz_t * sieve_primes(uint64_t maximum) {
  mpz_t * primes = (mpz_t*)malloc(sizeof(mpz_t));

  mpz_init_set_ui(*primes, 0);

  mpz_setbit(*primes, (mp_bitcnt_t)2);
  mpz_setbit(*primes, (mp_bitcnt_t)3);

  uint64_t max_root = isqrt(maximum);
  uint64_t n;
  for(uint64_t x = 1; x <= max_root; ++x) {
    uint64_t xx = x * x;
    for(uint64_t y = 1; y <= max_root; ++y) {
      uint64_t yy = y * y;
      n = 4*xx + yy;
      if(n <= maximum && ((n % 12 == 1) || (n % 12 == 5))) mpz_combit(*primes, n);

      n = 3*xx + yy;
      if(n <= maximum && (n % 12 == 7)) mpz_combit(*primes, n);

      n = 3*xx - yy;
      if(x > y && n <= maximum && (n % 12 == 11)) mpz_combit(*primes, n);
    }
  }

  for(n = 5; n <= max_root; n++) {
    if(mpz_tstbit(*primes, n)) {
      for(uint64_t k = 1; k * n*n <= maximum; k++) {
        mpz_clrbit(*primes, k * n*n);
      }
    }
  }
  return primes;
}
// Sieve of Atkins implementation borrowed from Wikipedia

// uint64_t gcd(uint64_t, uint64_t)
//
// Returns the Greatest Common Divisor of the two given 64-bit unsigned
// integers.
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
// Shamelessly stolen from http://en.wikipedia.org/wiki/Binary_GCD_algorithm

// uint64_t lcm(uint64_t, uint64_t)
//
// Returns the Least Common Multiple of the two given 64-bit unsigned integers.
uint64_t lcm(uint64_t a, uint64_t b) {
  return (a / gcd(a, b)) * b;
}

// uint64_t isqrt(uint64_t)
//
// Returns the integer square root of the given 64-bit unsigned integer. So, if
// given n, this returns the largest value x such that x*x <= n.
uint64_t isqrt(uint64_t n) {
  uint64_t x0 = 0;
  uint64_t x1 = n;

  while(x1 - x0 > 1) {
    x0 = x1;
    x1 = (x0 + n / x0) / 2;
  }
  return x1;
}

// bool is_palindrome(uint64_t)
//
// Returns true if the given 64-bit unsigned integer has the same value when
// its digits are reversed.
bool is_palindrome(uint64_t x) {
  uint64_t reversed = reverse_digits(x);

  return reversed == x;
}

// uint64_t reverse_digits(uint64_t)
//
// Uses purely numerical means to return the given 64-bit unsigned integer with
// its digits written in reverse order.
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

// bool is_prime(uint64_t)
//
// Returns true if the given 64-bit unsigned integer is prime.
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
// TODO: This is a really inefficient way of doing this.

uint64_t mpz_sum_of_digits(mpz_t x) {
  uint64_t sum = 0;
  mpz_t remainder;

  mpz_init(remainder);

  while(mpz_cmp_ui(x,0) != 0) {
    sum += mpz_tdiv_qr_ui(x, remainder, x, 10);
  }
  return sum;
}
