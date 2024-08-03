def solution(id_pw, db):
    answer = 'fail'
    for user in db:
        if id_pw[0] == user[0]:
            if id_pw[1] == user[1]:
                answer = "login"
            else:
                answer = "wrong pw"
    return answer