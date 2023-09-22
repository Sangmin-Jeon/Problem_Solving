from collections import deque

def solution(maps):
    def bfs(map, end_point):
        queue = deque()
        visited = [row[:] for row in map]
        dr = [0, 1, 0, -1]
        dc = [-1, 0, 1, 0]

        start_point = (0, 0, 1)
        queue.append(start_point)
        visited[start_point[0]][start_point[1]] = 0

        while queue:
            r, c, l = queue.popleft()

            for i in range(4):
                _r = r + dr[i]
                _c = c + dc[i]

                if 0 <= _r < len(map) and 0 <= _c < len(map[0]) and visited[_r][_c] != 0 and map[_r][_c] == 1:
                    if _r == end_point[0] and _c == end_point[1]:
                        return l + 1
                    queue.append((_r, _c, l + 1))
                    visited[_r][_c] = 0

        return -1

    end_point = (len(maps) - 1, len(maps[0]) - 1)
    return bfs(maps, end_point)