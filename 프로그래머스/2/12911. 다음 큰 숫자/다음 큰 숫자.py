from collections import Counter

def solution(n):
    answer = 0
    bi_n = bin(n).split('b')[1]
    n_cnt = Counter(bi_n)["1"]
    while n < 1000000:
        n += 1
        next_n = bin(n).split('b')[1]
        next_cnt = Counter(next_n)["1"]
        if n_cnt == next_cnt:
            answer = n
            break
    return answer