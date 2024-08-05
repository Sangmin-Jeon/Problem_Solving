def solution(rank, attendance):
    answer = 0
    h = {}
    for (i, r), att in zip(enumerate(rank), attendance):
        if att:
            h[r] = i
    l = list(h.keys())
    l.sort()
    return 10000 * h[l[0]] + 100 * h[l[1]] + h[l[2]]

