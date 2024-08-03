

def solution(board):
    mine_map = [[False] * len(board[0]) for _ in range(len(board))]
    for r in range(len(board)):
        for c in range(len(board[0])):
            if board[r][c] == 1:
                mine_map[r][c] = True
                get_mine(board, r, c, mine_map)
    return count_safe_area(mine_map)

def count_safe_area(mine_map):
    count = 0
    for r in range(len(mine_map)):
        for c in range(len(mine_map[0])):
            if not mine_map[r][c]:
                count += 1   
    return count
                
def get_mine(board, r, c, mine_map):

    dr = [0, 1, 0, -1, 1, 1, -1, -1]
    dc = [1, 0, -1, 0, 1, -1, -1, 1]

    for i in range(8):
        _dr = r + dr[i]
        _dc = c + dc[i]

        if _dr >= 0 and _dc >= 0 and _dr < len(board) and _dc < len(board[0]):
                mine_map[_dr][_dc] = True
                
                