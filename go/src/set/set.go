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
  left *Set
  contents uint64
  initialized bool
  right *Set
}

// Constructors ---------------------------------------------------------------

func NewSet(x uint64) (new_set *Set) {
  new_set             = new(Set)
  new_set.contents    = x
  new_set.initialized = true
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
      } else {
        s.left.Add(n)
      }
    } else if n > s.contents {
      if s.right == nil {
        s.right = NewSet(n)
      } else {
        s.right.Add(n)
      }
    }
  }
  return s
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

// Private methods -------------------------------------------------------------

func (root *Set) rotate_right() (pivot *Set) {
  pivot = root.left

  if pivot == nil || pivot.initialized != true {
    return root
  }

  root.left = pivot.right
  pivot.right = root
  return
}

func (root *Set) rotate_left() (pivot *Set) {
  pivot = root.right

  if pivot == nil || pivot.initialized != true {
    return root
  }

  root.right = pivot.left
  pivot.left = root
  return
}

func (root *Set) balance() *Set {
  fmt.Println("#balance not yet implemented.")
  return new(Set)
}
