/*
 * miller_rabin.h
 *
 * This is a simple, (hopefully) fast implementation of the famed Miller-Rabin
 * primality test, for rapidly determining if a given large number is prime.
 */

//--[ Static helper variables ]------------------------------------------------

// These are static arrays containing the values of A that should be tested for
// various special conditions. These are taken from the Wikipedia article on
// Miller-Rabin, and are the minimum necessary values to test with if the
// candidate number given is below certain thresholds. They are labeled in the
// format "A_XXXX" where XXXX is that threshold value.
static uint64_t A_1_373_653[2]           = [2, 3];
static uint64_t A_9_080_191[2]           = [31, 73];
static uint64_t A_4_759_123_141[3]       = [2, 7, 61];
static uint64_t A_2_152_302_898_747[5]   = [2, 3, 5, 7, 11];
static uint64_t A_3_474_749_660_383[6]   = [2, 3, 5, 7, 11, 13];
static uint64_t A_341_550_071_728_321[7] = [2, 3, 5, 7, 11, 13, 17];

bool miller_rabin_prime(uint64_t n) {
}
