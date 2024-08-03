def solution(clothes):
    answer = 1
    hash = make_hash(clothes)
    
    for _, value in hash.items():
        answer *= (value + 1)
    
    return answer - 1


def make_hash(clothes):
    result = {}
    for cloth in clothes:
        if cloth[1] in result:
            result[cloth[1]] += 1
        else:
            result[cloth[1]] = 1
    return result
