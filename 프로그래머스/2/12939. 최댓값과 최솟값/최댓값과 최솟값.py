def solution(s):
    nums = list(map(lambda s: int(s[1:]) * -1 \
                    if s[0] == "-" \
                    else int(s), s.split(" ")))
    return str(min(nums)) + ' ' + str(max(nums))