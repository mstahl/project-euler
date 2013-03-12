/*
 * An irrational decimal fraction is created by concatenating the positive
 * integers:
 * 
 * 0.123456789101112131415161718192021...
 * 
 * It can be seen that the 12th digit of the fractional part is 1.
 * 
 * If d_n represents the nth digit of the fractional part, find the value of
 * the following expression.
 * 
 * d_1 * d_10 * d_100 * d_1000 * d_10000 * d_100000 * d_1000000
 */

var Champernowne = (function () {
  var $ = function () {
    this.digits = []
    this.next   = 0
  }

  $.prototype = {
    digitsOf: function (n) {
      if(n < 10) {
        return [n]
      }
      else {
        var quot = Math.floor(n / 10),
            rem  = n % 10
        return this.digitsOf(quot).concat([rem])
      }
    },
    d: function (n) {
      while(this.digits.length < n) {
        this.digits = this.digits.concat(this.digitsOf(++this.next))
      }
      return this.digits[n - 1]
    }
  }

  return new $()
})()

with(Champernowne) {
  print(
    d(1000000) *
    d(100000) *
    d(10000) *
    d(1000) *
    d(100) *
    d(10) *
    d(1)
  )
}
