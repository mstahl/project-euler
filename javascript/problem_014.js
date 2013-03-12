/*
 * The following iterative sequence is defined for the set of positive
 * integers:
 *
 * n -> n/2    (n is even)
 * n -> 3n + 1 (n is odd)
 *
 * Using the rule above and starting with 13, we generate the following
 * sequence:
 *
 * 13  40  20  10  5  16  8  4  2  1
 *
 * It can be seen that this sequence (starting at 13 and finishing at 1)
 * contains 10 terms. Although it has not been proved yet (Collatz Problem), it
 * is thought that all starting numbers finish at 1.
 *
 * Which starting number, under one million, produces the longest chain?
 *
 * NOTE: Once the chain starts the terms are allowed to go above one million.
 */

var range = function (start, finish) {
  var list = []
  for(var i = start ; i <= finish ; ++i) {
    list.push(i)
  }
  return list
}

var collatz_length = function (n) {
  if(n == 1) {
    return 1
  }
  else if(n % 2 == 0) {
    return 1 + collatz_length(n / 2)
  }
  else {
    return 1 + collatz_length(3 * n + 1)
  }
}

var longest_chain_start  = 1,
    longest_chain_length = 0
for(var i = 1; i < 1000000; ++i) {
  var i_length = collatz_length(i)
  if(i_length > longest_chain_length) {
    longest_chain_start = i
    longest_chain_length = i_length
  }
}
print(longest_chain_start)
