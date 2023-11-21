import Foundation

let n = Int(readLine()!) ?? 0
var graph = [[Int]]()
var height = Set<Int>()
for _ in 0 ..< n {
    let row = readLine()!.split(separator: " ").map({ Int($0)! })
    row.forEach({
        height.insert($0)
    })
    graph.append(row)
}

var answer = 0
if height.count == 1 {
    answer = 1
}
else {
    for h in height {
        answer = max(answer, rainyDays(h: h))
    }
}
print(answer)

func rainyDays(h: Int) -> Int {
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var cnt = 0
    for r in 0 ..< n {
        for c in 0 ..< n {
            if !visited[r][c], graph[r][c] > h {
                cnt += bfs(h: h, r: r, c: c, visited: &visited)
            }
        }
    }

    return cnt
}

func bfs(h: Int, r: Int, c: Int, visited: inout [[Bool]]) -> Int {
    let dr = [0, 1, 0 , -1]
    let dc = [1, 0, -1, 0]

    var queue = [(Int, Int)]()
    queue.append((r, c))
    visited[r][c] = true

    while !queue.isEmpty {
        let visit = queue.removeFirst()

        for i in 0 ..< 4 {
            let nR = visit.0 + dr[i]
            let nC = visit.1 + dc[i]

            if nR >= 0, n > nR, nC >= 0, n > nC, !visited[nR][nC], graph[nR][nC] > h {
                queue.append((nR, nC))
                visited[nR][nC] = true
            }
        }

    }

    return 1
}