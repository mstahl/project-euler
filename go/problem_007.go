/*
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
 * that the 6th prime is 13.
 * 
 * What is the 10,001st prime number?
 */

package main

import "miller_rabin"

func main() {
  for i := 2; i < 1000; i++ {
    fmt.Println(i, miller_rabin.Test(i))
  }
}
