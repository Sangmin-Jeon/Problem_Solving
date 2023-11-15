import Foundation

let input = readLine()!.split(separator: " ").map({ Int($0)! })
let row = input[0]
let column = input[1]
var graph = [[Int]]()
for _ in 0 ..< row {
    let _row = readLine()!.split(separator: " ").map({ Int(String($0))! })
    graph.append(_row)
}

let answer = iceberg(graph: graph)
print(answer)

func iceberg(graph: [[Int]]) -> Int {
    var graph = graph 
    var time = -1
    while true {
        var visited = Array(repeating: Array(repeating: false, count: column), count: row)
        var pleace = 0

        for r in 0 ..< row {
            for c in 0 ..< column {
                if graph[r][c] > 0, !visited[r][c] {
                    pleace += bfs(graph: &graph, roc: (r: r, c: c), visited: &visited)
                }
            }
        }

        time += 1

        if pleace > 1 {
            return time
        }

        if pleace == 0 {
            return 0
        }
    }

}


func bfs(graph: inout [[Int]], roc: (r: Int, c: Int), visited: inout [[Bool]]) -> Int {
    let dr = [0, 1, 0, -1]
    let dc = [1, 0, -1, 0]

    var queue = [(Int, Int)]()
    queue.append((roc.r, roc.c))
    visited[roc.r][roc.c] = true

    while !queue.isEmpty {
        let (r, c) = queue.removeFirst()

        for i in 0 ..< 4 {
            let newR = r + dr[i]
            let newC = c + dc[i]

            if newR >= 0, newC >= 0, newR < row, newC < column, !visited[newR][newC] {
                if graph[newR][newC] > 0 {
                    queue.append((newR, newC))
                    visited[newR][newC] = true
                }
                else if graph[newR][newC] == 0, graph[r][c] > 0 {
                    graph[r][c] -= 1

                }   
            }
        }
    }

    return 1
}
