/*
 * 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
 * 
 * What is the sum of the digits of the number 2^1000?
 */

package main

import(
  "fmt"
  "math/big"
)

func main() {
  big_ass_number := big.NewInt(2)
  big_ass_number.Exp(big_ass_number, big.NewInt(1000), nil)

  sum_of_digits := 0
  big_ass_string := big_ass_number.String()
  for _, v := range big_ass_string {
    sum_of_digits += int(v - '0')
  }
  fmt.Println(sum_of_digits)
}
