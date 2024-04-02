def solution(routes):
    answer = 0
    routes.sort(key=lambda x: x[1])  # 나간 지점을 기준으로 routes 정렬
    camera = -30001  # 카메라 초기 위치, 범위 밖으로 설정

    for route in routes:
        if camera < route[0]:  # 카메라가 해당 차량 진입점보다 이전에 있지 않으면
            camera = route[1]  # 해당 차량이 나간 지점에 카메라 설치
            answer += 1  # 설치한 카메라 수 증가

    return answer

