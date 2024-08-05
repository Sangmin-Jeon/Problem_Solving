def solution(l, r):
    five = [5 for _ in range(len(str(r)))]
    zero = [0 for _ in range(len(str(r)) - 1)]
    arr = five + zero
    
    visited = [False for _ in range(len(arr))]
    
    def backtracking(comb, result):
        if len(comb) == len(str(r)):
            return
    
        for i in range(len(arr)):
            if not visited[i]:
                visited[i] = True
                comb.append(arr[i])
                
                temp = ''.join(map(str, comb))
                if int(temp) not in result and int(temp) != 0:
                    result.append(int(temp))
                
                backtracking(comb, result)
                comb.pop()
                visited[i] = False

    result = [] 
    backtracking([], result)
    answer = list(filter(lambda num: l <= num <= r, result))
    answer.sort()
    
    return answer if answer else [-1]
