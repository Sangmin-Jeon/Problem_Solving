from collections import deque

def dfs(board, x, y, block, value=1):
    directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    stack = [(x, y)]
    block.append((x, y))
    board[x][y] = -1  # 방문 처리
    
    while stack:
        current_x, current_y = stack.pop()
        for dx, dy in directions:
            next_x, next_y = current_x + dx, current_y + dy
            if 0 <= next_x < len(board) and 0 <= next_y < len(board[0]) and board[next_x][next_y] == value:
                board[next_x][next_y] = -1
                stack.append((next_x, next_y))
                block.append((next_x, next_y))

def rearrange(block):
    min_x = min(x for x, _ in block)
    min_y = min(y for _, y in block)
    return sorted([(x - min_x, y - min_y) for x, y in block])

def rotate(block):
    if len(block) == 1:
        return block
    rotated_blocks = [block]
    for _ in range(3):  # 블록을 3번 더 회전시켜 총 4개의 방향을 얻는다.
        new_block = [(-y, x) for x, y in rotated_blocks[-1]]
        rotated_blocks.append(rearrange(new_block))
    return min(rotated_blocks)

def solution(game_board, table):
    N = len(game_board)
    blocks, spaces = [], []
    
    for i in range(N):
        for j in range(N):
            if table[i][j] == 1:
                block = []
                dfs(table, i, j, block)
                blocks.append(rotate(rearrange(block)))
            if game_board[i][j] == 0:
                space = []
                dfs(game_board, i, j, space, 0)
                spaces.append(rotate(rearrange(space)))
    
    answer = 0
    for space in spaces:
        for block in blocks:
            if space == block:
                answer += len(block)
                blocks.remove(block)
                break
    
    return answer