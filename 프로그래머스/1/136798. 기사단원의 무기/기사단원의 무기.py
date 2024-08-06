import math

def solution(number, limit, power):
    answer = []
    def get_divisor(num):
        cnt = 0
        for n in range(1, int(math.sqrt(num)) + 1):
            if num % n == 0:
                if n == num // n:
                    cnt += 1
                else:
                    cnt += 2
        return cnt
    
    for num in range(1, number + 1):
        div = get_divisor(num)
        if div > limit: div = power
        answer.append(div)
        
    return sum(answer)
