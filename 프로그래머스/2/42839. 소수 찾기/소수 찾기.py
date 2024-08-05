from functools import reduce
import math

def solution(numbers):
    answer = 0
    comb = []
    visited = [False for _ in range(len(numbers))]    
    
    def combination(end, arr):
        if arr:
            num = reduce(lambda x, y: x + y, list(arr))
            comb.append(int(num))
        
        for i in range(len(numbers)):
            if not visited[i]:
                visited[i] = True
                arr.append(numbers[i])
                combination(end, arr)
                arr.pop()
                visited[i] = False
                
    combination(len(numbers), [])
    
    for num in set(comb):
        if is_prime_number(num):
            answer += 1
            
    return answer


def is_prime_number(m):
    if m < 2:
        return 0
    elif m == 2:
        return 1
    if m % 2 == 0:
        return 0
    for i in range(3, int(math.sqrt(m)) + 1, 2):
        if m % i == 0:
            return 0
    return 1
        