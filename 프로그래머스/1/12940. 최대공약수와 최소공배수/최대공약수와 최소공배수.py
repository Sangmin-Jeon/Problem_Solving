def solution(n, m):
    gcd = cal_gcd(n, m)
    lcm = lambda n, m, gcd: int(n * m // gcd)
    return [gcd, lcm(n, m, gcd)]

def cal_gcd(n, m):
    if m == 0:
        return n
    return cal_gcd(m, n % m)

