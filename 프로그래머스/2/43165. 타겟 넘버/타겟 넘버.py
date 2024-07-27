def solution(numbers, target):
    answer = 0
    max_depth = len(numbers)

    def DFS(depth, total_sum):
        nonlocal answer
        if max_depth == depth:
            if target == total_sum:
                answer += 1
            return

        DFS(depth + 1, total_sum + numbers[depth])
        DFS(depth + 1, total_sum - numbers[depth])


    DFS(0, 0)
    return answer
