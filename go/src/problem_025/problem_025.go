/*
 * The Fibonacci sequence is defined by the recurrence relation:
 * 
 * Fn = Fn1 + Fn2, where F1 = 1 and F2 = 1.
 * Hence the first 12 terms will be:
 * 
 * F_1  = 1
 * F_2  = 1
 * F_3  = 2
 * F_4  = 3
 * F_5  = 5
 * F_6  = 8
 * F_7  = 13
 * F_8  = 21
 * F_9  = 34
 * F_10 = 55
 * F_11 = 89
 * F_12 = 144
 * 
 * The 12th term, F_12, is the first term to contain three digits.
 * 
 * What is the first term in the Fibonacci sequence to contain 1000 digits?
 */

package main

import(
  "math"
)

func main() {
  logphi := math.Log10( ( 1.0 + math.Sqrt(5) ) / 2.0 )

  for i := 1.0; ; i += 1.0 {
    if num_digits := logphi * i; math.Ceil(num_digits) >= 1000.0 {
      println(uint(i + 1))
      return
    }
  }
}
