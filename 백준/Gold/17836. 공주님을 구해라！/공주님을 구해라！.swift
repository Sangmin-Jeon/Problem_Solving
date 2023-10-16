import Foundation

let input = readLine()!.split(separator: " ").map({ Int($0)! })
let n = input[0]
let m = input[1]
let t = input[2]

var graph = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

for _ in 0 ..< n {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph.append(t)
}


func bfs(row: Int, col: Int) -> [Int] {
    let dr = [1, 0, -1, 0]
    let dc = [0, 1, 0, -1]

    var answer = [Int]()

    var queue = [(r: Int, c: Int, d: Int)]()
    queue.append((r: 0, c: 0, d: 0))
    visited[0][0] = true

    while !queue.isEmpty {
        let visit = queue.removeFirst()
        var (r, c, d) = visit

        if r == (n - 1), c == (m - 1) {
            answer.append(d)
            break
        }

        for i in 0 ..< 4 {
            let row = r + dr[i]
            let col = c + dc[i]

            if row >= 0, n > row, col >= 0, m > col,
             !visited[row][col], graph[row][col] != 1 {
                if graph[row][col] == 2 {
                    let getPeach = ((m - 1) - row) + ((n - 1) - col) + (d + 1)
                    answer.append(getPeach)
                }

                queue.append((r: row, c: col, d: d + 1))
                visited[row][col] = true
            }
        }

    }

    return answer

}

let wayList = bfs(row: 0, col: 0)
let min = wayList.min() ?? 0
if min == 0 || min > t {
    print("Fail")
} else {
    print(min)
}
