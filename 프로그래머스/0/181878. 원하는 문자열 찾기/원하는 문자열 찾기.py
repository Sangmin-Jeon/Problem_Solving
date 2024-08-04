def solution(myString, pat):
    if len(myString) < len(pat):
        return 0
    
    for i in range(0, len(myString) - len(pat) + 1):
        print(myString[i:len(pat)])
        if myString[i:i + len(pat)].lower() == pat.lower():
            return 1
        
    return 0