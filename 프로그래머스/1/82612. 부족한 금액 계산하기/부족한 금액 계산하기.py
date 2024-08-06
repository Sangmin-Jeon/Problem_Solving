def solution(price, money, count):
    answer = sum([(i + 1) * price for i in range(count)])
    if answer >= money:
        return answer - money
    return 0

