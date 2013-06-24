/*
 * set
 * 
 * A package for making sets of things (implemented as binary trees).
 * 
 * (c) 2013 max thom stahl, released under the mit license
 */

package set

import "fmt"

type Set struct {
  // Structural fields
  parent *Set
  left *Set
  right *Set

  // Contents
  contents uint64

  // Metadata
  initialized bool
}

// Constructors ---------------------------------------------------------------

func NewSet(x ...uint64) (new_set *Set) {
  new_set = new(Set)
  for _, v := range x {
    new_set.Add(v)
  }
  return
}

func (s *Set) Add(n uint64) *Set {
  if !s.initialized {
    s.contents = n
    s.initialized = true
  } else {
    if n < s.contents {
      if s.left == nil {
        s.left = NewSet(n)
        s.left.parent = s
      } else {
        s.left.Add(n)
      }
    } else if n > s.contents {
      if s.right == nil {
        s.right = NewSet(n)
        s.right.parent = s
      } else {
        s.right.Add(n)
      }
    }
  }
  return s
}

func (s *Set) Find(x uint64) *Set {
  if x < s.contents {
    if s.left == nil {
      return nil
    } else {
      return s.left.Find(x)
    }
  } else if x > s.contents {
    if s.right == nil {
      return nil
    } else {
      return s.right.Find(x)
    }
  } else {
    return s
  }
}

func (s *Set) Height() int {
  if s == nil || s.initialized == false {
    return 0
  }
  if s.left == nil && s.right == nil {
    return 1
  } else {
    if lh, rh := s.left.Height(), s.right.Height(); lh > rh {
      return 1 + lh
    } else {
      return 1 + rh
    }
  }
}

func (sp *Set) Includes(n uint64) bool {
  s := *sp
  if s.initialized == false {
    return false
  }
  if s.contents == n {
    return true
  } else if n < s.contents {
    if s.left != nil {
      return s.left.Includes(n)
    } else {
      return false
    }
  } else if n > s.contents {
    if s.right != nil {
      return s.right.Includes(n)
    } else {
      return false
    }
  }
  return false
}

func (s *Set) String() (str string) {
  str += "("
  if s.left == nil {
    str += "nil"
  } else {
    str += s.left.String()
  }
  str += "," + string(s.contents) + ","
  if s.right == nil {
    str += "nil"
  } else {
    str += s.right.String()
  }
  str += ")"
  return
}

func (s *Set) Print() {
  if s == nil {
    fmt.Print("nil")
    return
  }
  fmt.Print("(")
  if s.left == nil {
    fmt.Print("nil")
  } else {
    s.left.Print()
  }
  fmt.Print(",", s.contents, ",")
  if s.right == nil {
    fmt.Print("nil")
  } else {
    s.right.Print()
  }
  fmt.Print(")")
}

func (s *Set) Size() (my_size int) {
  if s.left != nil {
    my_size += s.left.Size()
  }
  if s.right != nil {
    my_size += s.right.Size()
  }
  if s.initialized {
    my_size += 1
  }
  return
}

// Private methods -------------------------------------------------------------

func (root *Set) rotate_right() (pivot *Set) {
  pivot = root.left

  if pivot == nil || pivot.initialized != true {
    return root
  }

  root.left = pivot.right
  pivot.right = root

  root.left.parent = root
  pivot.right.parent = pivot
  pivot.parent = nil
  return
}

func (root *Set) rotate_left() (pivot *Set) {
  pivot = root.right

  if pivot == nil || pivot.initialized != true {
    return root
  }

  root.right = pivot.left
  pivot.left = root

  root.right.parent = root
  pivot.left.parent = pivot
  pivot.parent = nil
  return
}

func (root *Set) balance() *Set {
  fmt.Println("#balance not yet implemented.")
  return new(Set)
}
