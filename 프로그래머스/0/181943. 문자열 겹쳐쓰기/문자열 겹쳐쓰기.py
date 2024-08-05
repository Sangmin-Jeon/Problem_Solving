def solution(my_string, overwrite_string, s):
    if len(my_string) < len(overwrite_string):
        return my_string[:s] + overwrite_string
    return my_string[:s] + overwrite_string + my_string[s + len(overwrite_string):]