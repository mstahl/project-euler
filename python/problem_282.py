#!/usr/bin/python
# 
# For non-negative integers m, n, the Ackermann function A(m, n) is defined as follows:
# 
# 
# For example A(1, 0) = 2, A(2, 2) = 7 and A(3, 4) = 125.
# 
# Find A(n, n) and give your answer mod 148.

modulus = 14**8

def arrow2(a, b):
    result = 1
    for i in range(b):
        result = pow(a, result, modulus)
    return result

def arrow3(a, b):
    result = 1
    for i in range(b):
        result = arrow2(a, result)
    return result

print (arrow2(2, 7) - 3)
print (arrow3(2, 8) - 3)

