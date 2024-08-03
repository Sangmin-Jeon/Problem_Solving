def solution(answers):
    answer = []
    method_1 = [1, 2, 3, 4, 5]
    method_2 = [2, 1, 2, 3, 2, 4, 2, 5]
    method_3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    stu_1 = stu_2 = stu_3 = 0
    
    for i in range(len(answers)):
        if answers[i] == method_1[i % len(method_1)]:
            stu_1 += 1
        if answers[i] == method_2[i % len(method_2)]:
            stu_2 += 1
        if answers[i] == method_3[i % len(method_3)]:
            stu_3 += 1
    
    max_score = max(stu_1, stu_2, stu_3)
    if stu_1 == max_score:
        answer.append(1)
    if stu_2 == max_score:
        answer.append(2)
    if stu_3 == max_score:
        answer.append(3)
    
    return answer