def solution(arr, flag):
    answer = []
    for num, _flag in zip(arr, flag):
        if _flag:
            for _ in range(num * 2):
                answer.append(num)
        else:
            answer = answer[:-num]       
    return answer