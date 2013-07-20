/*
 * set
 * 
 * A package for making sets of things (implemented as binary trees).
 * 
 * (c) 2013 max thom stahl, released under the mit license
 */

package set

import "strconv"

type Set struct {
  // Structural fields
  parent *Set
  left *Set
  right *Set

  // Contents
  contents uint64

  // Metadata
  initialized bool
  color uint16
}

// Constants ------------------------------------------------------------------

const (
  RED   = 0xDEAD
  BLACK = 0xBEEF
)

// Constructors ---------------------------------------------------------------

func NewSet(x ...uint64) (new_set *Set) {
  new_set = new(Set)
  for _, v := range x {
    new_set.Add(v)
  }
  return
}

// Public methods -------------------------------------------------------------

func (s *Set) Add(n uint64) *Set {
  s = s.insert_and_return(n)

  return balance(s).Root()
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

func (s *Set) Root() *Set {
  if s.parent == nil {
    return s
  } else {
    return s.parent.Root()
  }
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

func (s *Set) String() (str string) {
  str += "("
  if s.left == nil {
    str += "nil"
  } else if s.left.initialized == false {
    str += "uninitialized"
  } else {
    str += s.left.String()
  }
  str += "," + strconv.FormatUint(s.contents, 10) + ","
  if s.right == nil {
    str += "nil"
  } else if s.right.initialized == false {
    str += "uninitialized"
  } else {
    str += s.right.String()
  }
  str += ")"
  return
}

// Private methods -------------------------------------------------------------

/*
 * balance[1-5]()
 *
 * Operates on a node returned by #insert_and_return to crawl back up the tree
 * towards the root, balancing and recolouring as it goes. This was lifted
 * shamelessly from the wikipedia article on red-black trees.
 */
func balance(n *Set) *Set {
  if n.parent == nil {
    n.color = BLACK
    return n
  } else {
    return balance2(n)
  }
}

func balance2(n *Set) *Set {
  if n.parent.color == BLACK {
    return n
  } else {
    return balance3(n)
  }
}

func balance3(n *Set) *Set {
  u, g := n.uncle(), n.grandparent()

  if u != nil && u.color == RED {
    n.parent.color = BLACK
    u.color = BLACK
    g.color = RED
    return balance(g)
  } else {
    return balance4(n)
  }
}

func balance4(n *Set) *Set {
  g := n.grandparent()

  if n == n.parent.right && n.parent == g.left {
    g.left = n.parent.rotate_left()
    n = n.left
  } else if n == n.parent.left && n.parent == g.right {
    g.right = n.parent.rotate_right()
    n = n.right
  }
  return balance5(n)
}

func balance5(n *Set) *Set {
  g := n.grandparent()
  n.parent.color = BLACK
  g.color = RED
  if n == n.parent.left {
    return g.rotate_right()
  } else {
    return g.rotate_left()
  }
}

func (root *Set) grandparent() *Set {
  if root.parent != nil {
    return root.parent.parent
  } else {
    return nil
  }
}

/*
 * insert_and_return(uint64)
 *
 * Inserts a node (if it doesn't already exist in the tree) and returns a
 * reference to the node it just inserted.
 */
func (root *Set) insert_and_return(x uint64) *Set {
  if root.initialized == false {
    root.contents = x
    root.initialized = true
    return root
  } else if x < root.contents {
    if root.left == nil {
      root.left = NewSet(x)
      return root.left
    } else {
      return root.left.insert_and_return(x)
    }
  } else if x > root.contents {
    if root.right == nil {
      root.right = NewSet(x)
      return root.right
    } else {
      return root.right.insert_and_return(x)
    }
  } else {
    return root
  }
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

func (root *Set) uncle() *Set {
  g := root.grandparent()
  if g == nil {
    return nil
  }
  if root.parent == g.left {
    return g.right
  } else {
    return g.left
  }
}
