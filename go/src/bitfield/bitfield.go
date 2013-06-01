/*
 * bitfield
 * 
 * Types and functions for dealing with bitfields.
 * 
 * (c) 2013 max thom stahl. released under the mit license.
 */

package bitfield

type Bitfield struct {
  representation []uint64
  size uint
}

func (b Bitfield) Clear(i uint) {
  q, r := divMod(i, 64)

  b.representation[q] = b.representation[q] &^ (1 << uint(r))
}

func (b Bitfield) ClearAll() {
  for i, _ := range b.representation {
    b.representation[i] = 0x0000000000000000
  }
}

func (b Bitfield) Peek(i uint) bool {
  q, r := divMod(i, 64)

  return b.representation[q] & (1 << uint(r)) != 0
}

func (b Bitfield) Toggle(i uint) bool {
  q, r := divMod(i, 64)

  b.representation[q] = b.representation[q] ^ (1 << uint(r))
  return b.Peek(i)
}

func (b Bitfield) Set(i uint) {
  q, r := divMod(i, 64)

  b.representation[q] = b.representation[q] | (1 << uint(r))
}

func (b Bitfield) SetAll() {
  for i, _ := range b.representation {
    b.representation[i] = 0xFFFFffffFFFFffff
  }
}

func NewBitfield(size uint) *Bitfield {
  b := new(Bitfield)
  b.representation = make([]uint64, (size / 64) + 1)
  b.size = size
  return b
}

// Unexported (private) functions ---------------------------------------------

func divMod(numerator, denominator uint) (uint, uint) {
  return numerator / denominator, numerator % denominator
}
