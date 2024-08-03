def solution(sizes):
    sorted_arr = []
    for size in sizes:
        sorted_arr.append(sorted(size))
    width = [w[0] for w in sorted_arr]
    height = [h[1] for h in sorted_arr]
    return max(width) * max(height)