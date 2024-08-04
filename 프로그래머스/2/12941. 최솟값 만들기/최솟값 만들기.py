def solution(A,B):
    A.sort()
    B.sort(reverse=True)
    
    answer = 0
    
    for num1, num2 in zip(A, B):
        answer += num1 * num2
    return answer