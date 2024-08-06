from functools import reduce

def solution(a, b):
    return reduce(lambda x, y: x + y, [i * j for i, j in zip(a, b)])