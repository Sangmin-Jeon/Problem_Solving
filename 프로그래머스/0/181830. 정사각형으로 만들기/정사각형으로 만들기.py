def solution(arr):
    answer = []
    if len(arr) > len(arr[0]):
        for i in range(len(arr)):
            answer.append(arr[i] + [0 for _ in range(len(arr) - len(arr[0]))])
    elif len(arr[0]) > len(arr):
        for _ in range(len(arr[0]) - len(arr)):
            arr.append([0 for _ in range(len(arr[0]))])
        answer = arr
    else:
        answer = arr
    return answer