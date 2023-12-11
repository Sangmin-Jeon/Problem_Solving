from itertools import combinations

N, S = map(int, input().split())
sequence = list(map(int, input().split()))

answer = 0

for r in range(1, N + 1):
    for combo in combinations(sequence, r):
        if sum(combo) == S:
            answer += 1

print(answer)
