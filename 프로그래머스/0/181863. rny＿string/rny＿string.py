def solution(rny_string):
    answer = ''.join(['rn' if s == 'm' else s for s in rny_string])
    return answer