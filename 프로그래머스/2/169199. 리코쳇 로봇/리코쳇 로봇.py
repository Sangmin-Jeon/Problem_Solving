from collections import deque
import sys

def solution(board):
    board = [list(u) for b in board for u in b.split(",")]
    visited = [[False for _ in range(len(board[0]))] for _ in range(len(board))]
    rows, cols = len(board), len(board[0])

    def BFS(start_r, start_c):
        queue = deque([(start_r, start_c, 0)])
        visited[start_r][start_c] = True

        dr = [1, 0, 0, -1]
        dc = [0, 1, -1, 0]

        min_num = sys.maxsize

        while queue:
            r, c, l = queue.popleft()

            if board[r][c] == "G":
                min_num = min(min_num, l)
                return min_num if min_num != sys.maxsize else -1

            for i in range(4):
                nr, nc = r, c
                while 0 <= nr + dr[i] < rows and 0 <= nc + dc[i] < cols \
                    and board[nr + dr[i]][nc + dc[i]] != 'D':
                    nr += dr[i]
                    nc += dc[i]
                if not visited[nr][nc]:
                    visited[nr][nc] = True
                    queue.append((nr, nc, l + 1))

        return -1

    for r in range(rows):
        for c in range(cols):
            if board[r][c] == "R":
                return BFS(r, c)

    return -1
