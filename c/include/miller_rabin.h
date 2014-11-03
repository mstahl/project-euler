/*
 * miller_rabin.h
 *
 * This is a simple, (hopefully) fast implementation of the famed Miller-Rabin
 * primality test, for rapidly determining if a given large number is prime.
 */

#ifndef MILLER_RABIN_H
#define MILLER_RABIN_H

bool miller_rabin_prime(uint64_t);

#endif /* MILLER_RABIN_H */
