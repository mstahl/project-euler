package bitfield

import "testing"

func TestClearAll(t *testing.T) {
  b := NewBitfield(32)
  b.representation[0] = 0xDEADBEEF
  b.ClearAll()
  r := uint64(1)
  for i := uint(0); i < b.size; i++ {
    if b.representation[0] & r != 0 {
      t.FailNow()
    }
    r = r << 1
  }
}

func TestClear(t *testing.T) {
  b := NewBitfield(64)
  b.representation[0] = 0xFFFF
  b.Clear(0)
  b.Clear(1)
  b.Clear(2)
  b.Clear(3)
  if b.representation[0] != 0xFFF0 {
    println("Clear doesn't work.")
    t.FailNow()
  }
}

func TestPeek(t *testing.T) {
  b := NewBitfield(4)
  b.representation[0] = 0xA

  if !(!b.Peek(0) && b.Peek(1) && !b.Peek(2) && b.Peek(3)) {
    t.FailNow()
  }
}

func TestToggle(t *testing.T) {
  b := NewBitfield(4)
  b.representation[0] = 0xF

  if b.Toggle(3) {
    println("Toggle return value incorrect (1)")
    t.FailNow()
  }
  if b.representation[0] != 0x7 {
    println("Post-toggle representation incorrect (1)")
    t.FailNow()
  }
  if !b.Toggle(3) {
    println("Toggle return value incorrect (2)")
    t.FailNow()
  }
  if b.representation[0] != 0xF {
    println("Post-toggle representation incorrect (2)")
    t.FailNow()
  }
}

func TestSet(t *testing.T) {
  b := NewBitfield(4)

  b.Set(1)
  b.Set(3)
  if b.size != 4 {
    println("Bitfield size incorrect.")
    t.FailNow()
  }
  if b.representation[0] != 0xA {
    println("Represented value wrong.")
    t.FailNow()
  }
}

func TestSetAll(t *testing.T) {
  b := NewBitfield(16)
  b.SetAll()
  r := uint64(1)
  for i := uint(0); i < b.size; i++ {
    if b.representation[0] & r == 0 {
      t.FailNow()
    }
    r = r << 1
  }
}

func TestSize(t *testing.T) {
  b := NewBitfield(37)
  if b.Size() != 37 {
    t.FailNow()
  }
}
