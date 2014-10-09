/*
 * bitfield.h
 *
 * Simple bitfield implemented with 64-bit unsigned integers.
 *
 * (c) 2014 max thom stahl
 */

#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

#define BASE 32

struct bitfield {
  uint64_t * storage;     // Actual bits where the bitfield data lives
  size_t size_in_bits;    // Width of entire bitfield, in bits
  size_t storage_size;    // Size of the storage array
};
typedef struct bitfield bitfield_t;

//--[ Initializing bitfields ]-------------------------------------------------

bitfield_t * bitfield_create(int);

//--[ Modifying bitfields ]----------------------------------------------------

void bitfield_set(bitfield_t *, int);
void bitfield_clear(bitfield_t *, int);
void bitfield_toggle(bitfield_t *, int);
void bitfield_set_all(bitfield_t *);
void bitfield_clear_all(bitfield_t *);

//--[ Querying bitfields ]-----------------------------------------------------

bool bitfield_query(bitfield_t *, int);
uint64_t bitfield_count(bitfield_t *);

//--[ Destroying bitfields ]---------------------------------------------------

void bitfield_teardown(bitfield_t *);
