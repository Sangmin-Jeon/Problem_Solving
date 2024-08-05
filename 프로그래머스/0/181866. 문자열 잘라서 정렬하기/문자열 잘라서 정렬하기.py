def solution(myString):
    split_arr = myString.split('x')
    answer = [s for s in split_arr if s != ""]
    answer.sort()
    return answer