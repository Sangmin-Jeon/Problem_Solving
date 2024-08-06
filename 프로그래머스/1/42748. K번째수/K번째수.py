def solution(array, commands):
    answer = []
    for command in commands:
        i, j, k = command[0], command[1], command[2]
        silce_answer = [array[i-1]] if i-1 == j else array[i-1:j]
        silce_answer.sort()
        answer.append(silce_answer[k-1])
    return answer