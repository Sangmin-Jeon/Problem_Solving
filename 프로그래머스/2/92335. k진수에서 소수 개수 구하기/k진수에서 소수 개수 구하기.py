def solution(n, k):
    answer = 0
    bit_number = ""
    
    while n > 0:
        remainder = n % k
        n = n // k
        bit_number = str(remainder) + bit_number
    for num in bit_number.split("0"):
        if num and is_prime_num(int(num)):
            answer += 1
    
    return answer


def is_prime_num(num):
    if num <= 1:
        return False
    elif num == 2:
        return True
    elif num % 2 == 0:
        return False
    else:
        for i in range(3, int(num**0.5) + 1, 2):
            if num % i == 0:
                return False
        return True
    