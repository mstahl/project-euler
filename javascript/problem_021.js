/*
 * Let d(n) be defined as the sum of proper divisors of n (numbers less than n
 * which divide evenly into n).  If d(a) = b and d(b) = a, where a  b, then a
 * and b are an amicable pair and each of a and b are called amicable numbers.
 * 
 * For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44,
 * 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4,
 * 71 and 142; so d(284) = 220.
 * 
 * Evaluate the sum of all the amicable numbers under 10000.
 */

var Amicability = (function () {
  var $ = function () {
    this.sigma_values = {}
  }
  $.prototype = {
    d: function (n) {
      if(this.sigma_values[n]) {
        return this.sigma_values[n]
      }
      else {
        this.sigma_values[n] = 0
        for(var i = 1; i <= Math.floor(n / 2); ++i) {
          if(n % i == 0) this.sigma_values[n] += i
        }
        return this.sigma_values[n]
      }
    },
    is_amicable: function (n) {
      return n == this.d(this.d(n)) && this.d(n) !== n
    }
  }

  return new $()
})()

var sum = 0
for(var i = 1; i < 10000; ++i) {
  if(Amicability.is_amicable(i)) sum += i
}
print(sum)
