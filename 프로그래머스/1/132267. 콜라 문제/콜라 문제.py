def solution(a, b, n):
    total = 0
    while n >= a:
        coke = (n // a) * b
        n = n % a + coke
        total += coke
    return total