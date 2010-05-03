



sum_of_squares = (1..100).map {|s| s * s}.inject(0) {|s, x| s + x}
square_of_sum  = (1..100).inject(0) {|s, x| s + x} ** 2

p square_of_sum - sum_of_squares
