/*
 * 2520 is the smallest number that can be divided by each of the numbers from
 * 1 to 10 without any remainder.
 * 
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
 */

package main

import "fmt"

func test(n int) bool {
  for i := 2; i <= 20; i++ {
    if n % i != 0 {
      return false
    }
  }
  return true
}

func main() {
  n := 21
  for {
    if test(n) {
      fmt.Println(n)
      return
    }
    n++
  }
}
