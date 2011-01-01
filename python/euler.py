

def factorial(n):
    if n < 2:
        return 1
    else:
        return n * factorial(n - 1)

def fibonaccis():
    """Generating function for Fibonacci numbers."""
    f1 = 1
    yield f1
    f2 = 1
    yield f2
    
    while True:
        f3 = f1 + f2
        yield f3
        (f1, f2) = (f2, f3)

def digits(n):
    if n == 0:
        return []
    (q, r) = divmod(n, 10)
    return [r] + digits(q)

def is_palindrome(n):
    ds = digits(n)
    sd = digits(n)
    sd.reverse()
    return ds == sd

def merge(a, b):
    """Merges two nondecreasing lists into one big nondecreasing list."""
    if len(a) == 0:
        return b
    elif len(b) == 0:
        return a
    elif a[0] < b[0]:
        return [a[0]] + merge(a[1:], b)
    elif a[0] > b[0]:
        return [b[0]] + merge(a, b[1:])
    else:
        return [a[0]] + merge(a[1:], b[1:])

# Some handy functors
def foldl(f, i, l):
    if len(l) == 0:
        return i
    else:
        return f(l[0], foldl(f, i, l[1:]))

def foldl1(f, l):
    if len(l) == 1:
        return l[0]
    else:
        return f(l[0], foldl1(f, l[1:]))