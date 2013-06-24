package set

import "testing"
import "fmt"

func TestAdd(t *testing.T) {
  s := NewSet(5)

  if s.Includes(5) != true {
    fmt.Println("Set isn't storing first item.")
    t.FailNow()
  }

  s = s.Add(2)

  if s.Includes(2) != true {
    fmt.Println("Set isn't storing second item.")
    t.FailNow()
  }
  if s.left.contents != 2 {
    fmt.Println("Set isn't storing 2 properly.")
  }

  s.Add(8)

  if s.Includes(8) != true {
    fmt.Println("Set isn't storing third item.")
    t.FailNow()
  }
  if s.right.contents != 8 {
    fmt.Println("Set isn't storing 8 properly.")
  }

  if !((s.left != nil && s.left.Includes(2)) || (s.right != nil && s.right.Includes(8))) {
    fmt.Println("Set tree structure jacked up.")
    t.FailNow()
  }
}

/*
 * func TestBalance(t *testing.T) {
 *   s := NewSet(0)
 *   for i := uint64(1) ; i < 16 ; i++ {
 *     s = s.Add(i)
 *   }
 *   if h := s.Height(); h != 4 {
 *     fmt.Println("Expected 4, got ", h)
 *     t.FailNow()
 *   }
 * }
 */

func TestRotateRight(t *testing.T) {
  s            := NewSet(5)
  s.left       = NewSet(3)
  s.left.left  = NewSet(2)
  s.left.right = NewSet(4)
  s.right      = NewSet(7)

  s = s.rotate_right()

  if s.contents != 3 {
    println("Rotate right failed.")
    t.FailNow()
  }
  if satisfies_bst_property(s) != true {
    println("Rotate right failed.")
    t.FailNow()
  }
}

func TestRotateLeft(t *testing.T) {
  s := new(Set)
  s.initialized = true
  s.contents = 3
  s.left = new(Set)
  s.left.initialized = true
  s.left.contents = 2
  s.right = new(Set)
  s.right.initialized = true
  s.right.contents = 5
  s.right.left = new(Set)
  s.right.left.initialized = true
  s.right.left.contents = 4
  s.right.right = new(Set)
  s.right.right.initialized = true
  s.right.right.contents = 7

  s = s.rotate_left()

  if s.contents != 5 {
    println("Rotate left failed.")
    t.FailNow()
  }
  if satisfies_bst_property(s) != true {
    println("Rotate left failed.")
    t.FailNow()
  }
}

// Naïve implementation (with no auto-balancing):
// 
//   BenchmarkAddAndSearch1000000000         0.21 ns/op
//   ok    _/Users/max/projects/project-euler/go/src/set2.155s
//   BenchmarkAddAndSearch10000000001000000000         0.21 ns/op
//   ok    _/Users/max/projects/project-euler/go/src/set2.152s
//   BenchmarkAddAndSearch100000000010000000001000000000         0.21 ns/op
//   ok    _/Users/max/projects/project-euler/go/src/set2.155s
//   BenchmarkAddAndSearch1000000000100000000010000000001000000000         0.21 ns/op
//   ok    _/Users/max/projects/project-euler/go/src/set2.167s
//   BenchmarkAddAndSearch10000000001000000000100000000010000000001000000000         0.21 ns/op
//   ok    _/Users/max/projects/project-euler/go/src/set2.153s
func BenchmarkAddAndSearch(b *testing.B) {
  s := NewSet(1)
  limit := uint64(4096)
  for i := uint64(1); i < limit; i++ {
    s = s.Add(i)
  }
  for i := uint64(0); i < limit; i++ {
    _ = s.Includes(i)
  }
}

// Private testing methods ----------------------------------------------------

func satisfies_bst_property(s *Set) bool {
  if s.left != nil {
    if s.left.contents > s.contents {
      return false
    } else if satisfies_bst_property(s.left) == false {
      return false
    }
  }
  if s.right != nil {
    if s.right.contents < s.contents {
      return false
    } else if satisfies_bst_property(s.right) == false {
      return false
    }
  }
  return true
}
