from functools import reduce

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

def is_prime_number(num):
    if num <= 1:
        return False
    if num <= 3:
        return True
    if num % 2 == 0 or num % 3 == 0:
        return False
    i = 5
    while i * i <= num:
        if num % i == 0 or num % (i + 2) == 0:
            return False
        i += 6
    return True
        