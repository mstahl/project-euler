/*
 * The prime 41, can be written as the sum of six consecutive primes:
 * 
 * 41 = 2 + 3 + 5 + 7 + 11 + 13
 * 
 * This is the longest sum of consecutive primes that adds to a prime below
 * one-hundred.
 * 
 * The longest sum of consecutive primes below one-thousand that adds to a
 * prime, contains 21 terms, and is equal to 953.
 * 
 * Which prime, below one-million, can be written as the sum of the most
 * consecutive primes?
 */

package main

import "primes"

const limit = 1000000

func binarySearch(haystack *[]uint64, needle uint64) bool {
  for _, v := range *haystack {
    if v == needle {
      return true
    }
  }
  return false
}

func sum(list *[]uint64, start int, end int) (s uint64) {
  for i := start; i < end; i++ {
    s += (*list)[i]
  }
  return
}

func main() {
  primesToOneMillion := primes.PrimesToLimit(limit)
  longest_list_length, answer := 0, uint64(0)
  for start := 0; start < len(*primesToOneMillion) - 1; start++ {
    for end := start + 1; end < len(*primesToOneMillion); end++ {

      if end - start < longest_list_length {
        continue
      }

      // fmt.Println("       Considering [", start, ", ", end, "]")

      s := sum(primesToOneMillion, start, end)
      if s > limit {
        break
      }

      if binarySearch(primesToOneMillion, s) {
        if end - start > longest_list_length {
          answer = s
          longest_list_length = end - start
        }
      }
    }
  }
  println(answer)

}
