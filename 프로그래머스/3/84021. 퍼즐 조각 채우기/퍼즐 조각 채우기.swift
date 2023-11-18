import Foundation

func solution(_ gameBoard: [[Int]], _ table: [[Int]]) -> Int {
    let gameBoardPaths = boardPath(gameBoard)
    var tablePaths = tablePath(table)
    var matchedGameBoardIndices = Set<Int>()
    var matchedTableIndices = Set<Int>()
    var result = 0

    for rotation in 0..<4 {
        for (i, gameBoardPath) in gameBoardPaths.enumerated() where !matchedGameBoardIndices.contains(i) {
            for (j, tablePath) in tablePaths.enumerated() where !matchedTableIndices.contains(j) && gameBoardPath.count == tablePath.count {
                if canMatch(gameBoardPath, tablePath) {
                    result += gameBoardPath.count
                    matchedGameBoardIndices.insert(i)
                    matchedTableIndices.insert(j)
                    break
                }
            }
        }
        if rotation < 3 {
            tablePaths = rotate(tablePaths)
        }
    }

    return result
}

func canMatch(_ gameBoardPath: [(Int, Int)], _ tablePath: [(Int, Int)]) -> Bool {
    let offsetX = gameBoardPath[0].0 - tablePath[0].0
    let offsetY = gameBoardPath[0].1 - tablePath[0].1

    for (index, (x, y)) in tablePath.enumerated() {
        if gameBoardPath[index] != (x + offsetX, y + offsetY) {
            return false
        }
    }

    return true
}

func boardPath(_ board: [[Int]]) -> [[(Int, Int)]] {
    var paths: [[(Int, Int)]] = []
    var visited = Array(repeating: Array(repeating: false, count: board.count), count: board.count)

    for i in 0..<board.count {
        for j in 0..<board.count where !visited[i][j] && board[i][j] == 0 {
            paths.append(dfs(&visited, board, i, j, 0))
        }
    }

    return paths
}

func tablePath(_ table: [[Int]]) -> [[(Int, Int)]] {
    var paths: [[(Int, Int)]] = []
    var visited = Array(repeating: Array(repeating: false, count: table.count), count: table.count)

    for i in 0..<table.count {
        for j in 0..<table.count where !visited[i][j] && table[i][j] == 1 {
            paths.append(dfs(&visited, table, i, j, 1))
        }
    }

    return paths
}

func dfs(_ visited: inout [[Bool]], _ board: [[Int]], _ x: Int, _ y: Int, _ value: Int) -> [(Int, Int)] {
    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    var stack: [(Int, Int)] = [(x, y)]
    var path: [(Int, Int)] = []
    visited[x][y] = true

    while let (cx, cy) = stack.popLast() {
        path.append((cx, cy))
        for direction in directions {
            let (dx, dy) = direction
            let nx = cx + dx
            let ny = cy + dy
            if nx >= 0 && nx < board.count && ny >= 0 && ny < board.count && !visited[nx][ny] && board[nx][ny] == value {
                visited[nx][ny] = true
                stack.append((nx, ny))
            }
        }
    }

    return path.sorted { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }
}


func rotate(_ paths: [[(Int, Int)]]) -> [[(Int, Int)]] {
    return paths.map { path in
        let sortedPath = path.sorted { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }
        return sortedPath.map { point in
            (-point.1, point.0)
        }.sorted { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }
    }
}

