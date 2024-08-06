def solution(word):
    words = ['A', 'E', 'I', 'O', 'U']
    end = len(words)
    word = list(word)
    global idx, answer
    idx = answer = 0
    
    def DFS(arr):
        global idx, answer
        if len(arr) == end:
            return
        
        for i in range(end):
            arr.append(words[i])
            idx += 1
            if arr == word and answer == 0:  
                answer = idx
                return
            DFS(arr)
            arr.pop()
            
    DFS([])
    
    return answer
