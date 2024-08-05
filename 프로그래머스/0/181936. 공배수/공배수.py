import math

def solution(number, n, m):
    answer = math.gcd(number, n) + math.gcd(number, m)
    return 1 if answer == n + m else 0