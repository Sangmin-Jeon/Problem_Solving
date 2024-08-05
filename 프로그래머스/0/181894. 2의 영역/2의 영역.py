

def solution(arr):
    idx = [i for i, num in enumerate(arr) if num == 2]
    return arr[idx[0]: idx[-1] + 1] if idx else [-1]