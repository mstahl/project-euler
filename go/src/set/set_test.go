package set

import "testing"
// import "fmt"

func TestAdd(t *testing.T) {
  s := NewSet(5)

  if s.Includes(5) != true {
    t.Error("Set isn't storing first item.")
  }

  s = s.Add(2)

  if s.Includes(2) != true {
    t.Error("Set isn't storing second item.")
  }
  if s.left.contents != 2 {
    t.Error("Set isn't storing 2 properly.")
  }

  s.Add(8)

  if s.Includes(8) != true {
    t.Error("Set isn't storing third item.")
  }
  if s.right.contents != 8 {
    t.Error("Set isn't storing 8 properly.")
  }

  if !((s.left != nil && s.left.Includes(2)) || (s.right != nil && s.right.Includes(8))) {
    t.Error("Set tree structure jacked up.")
  }
}

func TestBalance(t *testing.T) {
  // t.Skip("Balance not implemented yet.")
  s := NewSet()
  for i := uint64(0) ; i < 16 ; i++ {
    s = s.Add(i)
  }
  if h := s.Height(); false || h != 4 {
    t.Error("Expected 4, got ", h)
  }
}

func TestNewSet(t *testing.T) {
  s1 := NewSet()
  if s1.initialized == true {
    t.Error("NewSet doesn't work without arguments.")
  }

  s2 := NewSet(1)
  if s2.initialized == false {
    t.Error("NewSet not initialized.")
  }
  if s2.contents != 1 {
    t.Error("NewSet contents wrong with one argument.")
  }

  s3 := NewSet(1, 2, 3)
  if s3.Size() != 3 {
    t.Error("NewSet size wrong after variadic initialization.")
  }
}

func TestRotateLeft(t *testing.T) {
  s            := NewSet(3)
  s.left        = NewSet(2)
  s.right       = NewSet(5)
  s.right.left  = NewSet(4)
  s.right.right = NewSet(7)

  s.left.parent        = s
  s.right.parent       = s
  s.right.left.parent  = s.right
  s.right.right.parent = s.right

  s = s.rotate_left()

  if s.contents != 5 {
    t.Error("Rotate left: contents of root node incorrect")
  }
  if satisfies_bst_property(s) != true {
    t.Error("Rotate left: BST property not satisfied")
  }
}

func TestRotateRight(t *testing.T) {
  s           := NewSet(5)
  s.left       = NewSet(3)
  s.left.left  = NewSet(2)
  s.left.right = NewSet(4)
  s.right      = NewSet(7)

  s.left.parent       = s
  s.left.left.parent  = s.left
  s.left.right.parent = s.left
  s.right.parent      = s

  s = s.rotate_right()

  if s.contents != 3 {
    t.Error("Rotate right: contents of root node incorrect")
  }
  if satisfies_bst_property(s) != true {
    t.Error("Rotate right: BST property not satisfied")
  }
}

func TestSize(t *testing.T) {
  s := NewSet()
  s.Add(1)
  s.Add(2)
  s.Add(3)

  if s.Size() != 3 {
    t.Errorf("Size is wrong. Expected %d, got %d", 3, s.Size())
  }
}

func TestFind(t *testing.T) {
  s := NewSet(1, 2, 3, 4, 5, 6, 7)

  if s.Find(4) == nil {
    t.Error("Find doesn't work.")
  }
}

func TestTreeConsistency(t *testing.T) {
  s := NewSet(1, 2, 3, 4, 5, 6, 7)

  if s.Find(7).parent == nil || s.Find(7).parent.contents != 6 {
    t.Error("Parentage not working.")
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

    if s.left.parent != s {
      return false
    }
  }
  if s.right != nil {
    if s.right.contents < s.contents {
      return false
    } else if satisfies_bst_property(s.right) == false {
      return false
    }

    if s.right.parent != s {
      return false
    }
  }
  return true
}
