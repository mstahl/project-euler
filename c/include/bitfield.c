/*
 * bitfield.h
 *
 * Simple bitfield implemented with 64-bit unsigned integers.
 *
 * (c) 2014 max thom stahl
 */

#include "bitfield.h"
#include <stdio.h>

//--[ Initializing bitfields ]-------------------------------------------------

bitfield_t * bitfield_create(int size) {
  bitfield_t * bf = (bitfield_t *)malloc(sizeof(bitfield_t));
  bf->size_in_bits = size;
  bf->storage_size = size / BASE + 1;
  printf("storage size = %d\n", (int)bf->storage_size);
  bf->storage = (uint64_t *)calloc(bf->storage_size, sizeof(uint64_t));

  for(uint64_t * p = bf->storage; p < bf->storage + bf->storage_size; ++p) {
    *p = 0;
  }

  return bf;
}

//--[ Modifying bitfields ]----------------------------------------------------

void bitfield_set(bitfield_t * bits, int index) {
  bits->storage[index / BASE] = bits->storage[index / BASE] | (1 << (index % BASE));
}

void bitfield_clear(bitfield_t * bits, int index) {
  bits->storage[index / BASE] = bits->storage[index / BASE] & (~(1 << (index % BASE)));
}

void bitfield_toggle(bitfield_t * bits, int index) {
  bits->storage[index / BASE] = bits->storage[index / BASE] ^ (1 << (index % BASE));
}

void bitfield_set_all(bitfield_t * bits) {
  for(int i = 0; i < bits->storage_size; ++i) {
    bits->storage[i] = ~0;
  }

  // For the last field, we need to shift it over a few places so that none of
  // the bits outside the part being used for the bitfield are set (this throws
  // off counts of 1s in the bitfield otherwise).
  bits->storage[bits->storage_size - 1] >>= BASE - (bits->size_in_bits % BASE);
}

void bitfield_clear_all(bitfield_t * bits) {
  for(int i = 0; i < bits->storage_size; ++i) {
    bits->storage[i] = 0;
  }
}

//--[ Querying bitfields ]-----------------------------------------------------

bool bitfield_query(bitfield_t * bits, int index) {
  return (bits->storage[index / BASE] & (1 << (index % BASE))) != 0;
}

uint64_t bitfield_count(bitfield_t * bits) {
  uint64_t count = 0;

  for(uint64_t * p = bits->storage; p - bits->storage < bits->storage_size; ++p) {
    uint64_t field = *p;
    while(field > 0) {
      count += field & 1;
      field >>= 1;
    }
  }
  return count;
}

//--[ Destroying bitfields ]---------------------------------------------------

void bitfield_destroy(bitfield_t * bits) {
  free(bits->storage);
  free(bits);
}

/******************************************************************************/

int main(void) {
  bitfield_t * bitz = bitfield_create(100);
  bitfield_set(bitz, 17);
  bitfield_set(bitz, 75);
  bitfield_set(bitz, 90);

  printf("count is %d\n", (int)bitfield_count(bitz));

  bitfield_clear(bitz, 17);

  for(int i = 0; i < 100; ++i) {
    if(bitfield_query(bitz, i)) printf("%d: 1\n", i);
    else printf("%d: 0\n", i);
  }

  printf("----\n");

  bitfield_set_all(bitz);
  printf("count is %d\n", (int)bitfield_count(bitz));
  bitfield_clear_all(bitz);
  printf("count is %d\n", (int)bitfield_count(bitz));


  bitfield_destroy(bitz);

  return 0;
}
