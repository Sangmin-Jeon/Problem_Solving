def solution(arr, queries):
    answer = []
    for query in queries:
        s, e, k = query[0], query[1], query[2]
        r = list(filter(lambda x: x > k, arr[s:e + 1]))
        answer.append(-1) if not r else answer.append(min(r))
    return answer