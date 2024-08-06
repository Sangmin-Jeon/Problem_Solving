def solution(lottos, win_nums):
    rank = {6: 1, 5: 2, 4: 3, 3: 4, 2: 5, 1: 6, 0: 6}
    win = loss= 0
    
    for num in lottos:
        if num in win_nums or num == 0:
            win += 1
        
        if num in win_nums:
            loss += 1
        
    return [rank[win], rank[loss]]

