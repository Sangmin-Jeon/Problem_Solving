import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var mazeMap = [[Int]]()
for _ in 0 ..< m {
    let row = readLine()!.map { Int(String($0))! }
    mazeMap.append(row)
}

let answer = bfs()
print(answer)

func bfs() -> Int {
    var answer = 0
    let dr = [0, 1, 0, -1]
    let dc = [1, 0, -1, 0]
    var queue = [(p: (Int,Int), d: Int)]()
    var visited = Array(repeating: Array(repeating: false, count: n), count: m)

    queue.append((p: (0, 0), d: 0))
    visited[0][0] = true

    while !queue.isEmpty {
        queue.sort(by: { $0.d < $1.d })
        let visit = queue.removeFirst()
        let ((r, c), d) = visit
        
        if r == (m - 1), c == (n - 1) {
            answer = d
            break
        }
        
        for i in 0 ..< 4 {
            let cdr = r + dr[i]
            let cdc = c + dc[i]

            if cdr >= 0, m > cdr, cdc >= 0, n > cdc, !visited[cdr][cdc] {
                visited[cdr][cdc] = true
                queue.append((p: (cdr, cdc), d: mazeMap[cdr][cdc] == 1 ? (d + 1) : d))
            }
        }
        
    }

    return answer
    
}