



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

