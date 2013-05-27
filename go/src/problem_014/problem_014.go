/*
 * The following iterative sequence is defined for the set of positive
 * integers:
 * 
 * n -> n/2 (n is even)
 * n -> 3n + 1 (n is odd)
 * 
 * Using the rule above and starting with 13, we generate the following
 * sequence:
 * 
 * 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
 * 
 * It can be seen that this sequence (starting at 13 and finishing at 1)
 * contains 10 terms. Although it has not been proved yet (Collatz Problem), it
 * is thought that all starting numbers finish at 1.
 * 
 * Which starting number, under one million, produces the longest chain?
 * 
 * NOTE: Once the chain starts the terms are allowed to go above one million.
 */

package main

func collatz_length(n int) (i int) {
  if n == 1 { return 1 }

  for n > 1 {
    if n & 1 == 0 {
      n = n >> 1
    } else {
      n = 3 * n + 1
    }
    i++
  }
  return
}

func main() {
  longest_starting_number, longest_chain_length := 0, 0

  for i := 1; i < 1000000; i++ {
    if cl := collatz_length(i); cl > longest_chain_length {
      longest_chain_length = cl
      longest_starting_number = i
    }
  }
  println(longest_starting_number)
}
