def solution(k, m, score):
    answer = 0
    score.sort(reverse=True)
    
    def get_sep_score():
        sep_score = []
        temp = []
        for _score in score:
            temp.append(_score)
            if len(temp) == m:
                sep_score.append(temp)
                temp = []
        return sep_score
    
    def cal_score(score):
        answer = 0
        for _score in score:
            answer += _score[-1] * m
                
        return answer
    
    sep_score = get_sep_score()
    
    return cal_score(sep_score)