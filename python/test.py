#!/usr/bin/python

from euler import *

print( partitions(10) )
print( list_partitions_of(10) )

# def logEntryExit(f):
    # def f1():
        # print("+++ Entering " + f.__name__)
        # f()
        # print("--- Exiting " + f.__name__)
    # return f1

# @logEntryExit
# def foo():
    # pass

# foo()

# class memoize(object):
    # cache = {}
    # def __init__(self, f):
        # self.f = f
    
    # def __call__(self, n):
        # if n not in self.cache:
            # self.cache[n] = self.f(n)
        # return self.cache[n]

# @memoize
# def fibonacci(n):
    # if n < 2:
        # return 1
    # else:
        # return fibonacci(n - 1) + fibonacci(n - 2)

# print(fibonacci(n) for n in range(0,1000))
