/*
 * A palindromic number reads the same both ways. The largest palindrome made
 * from the product of two 2-digit numbers is 9009 = 91 99.
 * 
 * Find the largest palindrome made from the product of two 3-digit numbers.
 */

package main

import "fmt"

func reverse(array []int) (reversed_array []int) {
  reversed_array = make([]int, len(array))
  for i, v := range array {
    reversed_array[len(array) - 1 - i] = v
  }
  return
}

func digits(n int) ([]int) {
  if n == 0 {
    return []int{}
  }
  q, r := n / 10, n % 10
  return append(digits(q), r)
}

func is_palindrome(n int) bool {
  d := digits(n)
  r := reverse(d)
  for i, v := range d {
    if v != r[i] {
      return false
    }
  }
  return true
}

func main() {
  largest := 0

  for i := 100; i < 999; i++ {
    for j := 100; j < 999; j++ {
      product := i * j
      if product > largest && is_palindrome(product) {
        // TODO: Write a blog entry or something about the huge performance difference 
        // between the above line and the same with the terms swapped.
        largest = product
      }
    }
  }
  fmt.Println(largest)
}
