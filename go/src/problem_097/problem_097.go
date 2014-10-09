/*
 * The first known prime found to exceed one million digits was discovered in
 * 1999, and is a Mersenne prime of the form 269725931; it contains exactly
 * 2,098,960 digits. Subsequently other Mersenne primes, of the form 2p1, have
 * been found which contain more digits.
 * 
 * However, in 2004 there was found a massive non-Mersenne prime which contains
 * 2,357,207 digits: 28433*2^7830457+1.
 * 
 * Find the last ten digits of this prime number.
 */

package main

import(
  "math/big"
  "fmt"
)

func main() {
  n, modulus := big.NewInt(2), big.NewInt(10000000000)
  n.Exp(n, big.NewInt(7830457), modulus)
  n.Mul(n, big.NewInt(28433))
  n.Mod(n, modulus)
  n.Add(n, big.NewInt(1))
  fmt.Println(n)
}
