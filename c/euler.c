/*
 * euler.c
 *
 * Standard library of useful Project Euler related functions.
 */

#include "euler.h"

bool is_prime(long x) {
  if(x == 1) { return false; }
  if((x & 1) == 0) { return false; }

  for(long d = 3; d < x / 2; d++) {
    if(x % d == 0) {
      return false;
    }
  }
  return true;
}

bool is_palindrome(long x) {
  long max_exp = floor(log10((double)x));
  long reversed = 0;

  long xx = x;
  for(long exp = max_exp; exp >= 0; exp--) {
    long digit = xx % 10;
    xx = xx / 10;
    reversed = reversed * 10 + digit;
  }

  return reversed == x;
}
