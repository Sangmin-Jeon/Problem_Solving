def solution(array, commands):
    answer = []

    for command in commands:
        i = command[0] - 1
        j = command[1]
        k = command[2] - 1

        answer.append(sorted(array[i:j])[k])

    return answer