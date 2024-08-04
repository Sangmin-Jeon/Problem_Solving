def solution(my_string, alp):
    return ''.join([s.upper() if s == alp else s for s in my_string])