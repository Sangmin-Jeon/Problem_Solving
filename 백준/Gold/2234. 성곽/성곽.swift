import Foundation

let input = readLine()!.split(separator: " ").map({ Int($0)! })
var graph = [[Int]]()
for _ in 0 ..< input[1] {
    let row = readLine()!.split(separator: " ").map({ Int($0)! })
    graph.append(row)
}

var visited = Array(repeating: Array(repeating: false, count: input[0]), count: input[1])
var wallInfo = Array(repeating: Array(repeating: (-1, -1), count: input[0]), count: input[1])
var roomCnt = 0

let wall = [8, 4, 2, 1]
let dr = [1, 0, -1, 0]
let dc = [0, 1, 0, -1]

let answer = searchCastle()
print(answer.roomCnt) // 성에 있는 방의 개수
print(answer.maxWall) // 가장 넓은 방의 넓이
print(getMaxWallCnt()) // 하나의 벽을 제거하여 얻을 수 있는 가장 넓은 방의 크기

func searchCastle() -> (roomCnt: Int, maxWall: Int) {
    var maxWall = 0
    for r in 0 ..< input[1] {
        for c in 0 ..< input[0] {
            if !visited[r][c] {
                maxWall = max(maxWall, bfs(r: r, c: c, rIdx: roomCnt))
                roomCnt += 1
            }
        }
    }

    return (roomCnt: roomCnt, maxWall: maxWall)

}

func bfs(r: Int, c: Int, rIdx: Int) -> Int {
    var wallCnt = 0
    var queue = [(Int, Int)]()
    queue.append((r, c))
    visited[r][c] = true
    var roomInfo = Array(repeating: Array(repeating: false, count: input[0]), count: input[1])
    
    while !queue.isEmpty {
        let visit = queue.removeFirst()
        let (cR, cC) = visit
        var wallNum = graph[cR][cC]

        roomInfo[cR][cC] = true
        wallCnt += 1

        for i in 0 ..< 4 {
            let nR = cR + dr[i]
            let nC = cC + dc[i]
            
            if wallNum >= wall[i] {
                wallNum -= wall[i]
                continue
            }

            if input[1] > nR, input[0] > nC, nR >= 0, nC >= 0, !visited[nR][nC] {
                queue.append((nR, nC))
                visited[nR][nC] = true
            }
        }
    }

    for r in 0 ..< input[1] {
        for c in 0 ..< input[0] {
            if roomInfo[r][c] {
                wallInfo[r][c] = (rIdx, wallCnt)
            }
        }
    }

    return wallCnt

}

func getMaxWallCnt() -> Int {
    var answer = 0
    for r in  0 ..< input[1] {
        for c in 0 ..< input[0] {
            let base = wallInfo[r][c]
            for i in 0 ..< 4 {
                let nR = r + dr[i]
                let nC = c + dc[i]
                if input[1] > nR, input[0] > nC, nR >= 0, nC >= 0, base.0 != wallInfo[nR][nC].0 {
                    answer = max(answer, base.1 + wallInfo[nR][nC].1)
                }
            }
        }
    }

    return answer

}
