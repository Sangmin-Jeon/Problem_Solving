import Foundation

var graph = [[Int]](repeating: [], count: 10001)
var visited = [(Bool, [Int])](repeating: (false, []), count: 10001)
var start = 0
var end = 0

func bfs(_ s: Int, _ e: Int) {
    var queue = [Int]()
    queue.append(s)
    visited[s].0 = true
    while !queue.isEmpty {
        let x = queue.removeFirst()
        visited[x].1.append(x)
        if x == e {
            return
        }
        graph[x].sort()
        for i in 0..<graph[x].count {
            let nx = graph[x][i]
            if !visited[nx].0 {
                visited[nx].0 = true
                visited[nx].1 = visited[x].1
                queue.append(nx)
            }
        }
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]

for _ in 1...M {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let v1 = edge[0]
    let v2 = edge[1]
    graph[v1].append(v2)
    graph[v2].append(v1)
}

let startEnd = readLine()!.split(separator: " ").map { Int($0)! }
start = startEnd[0]
end = startEnd[1]

var go = 0
var back = 0
bfs(start, end)
go = visited[end].1.count - 1
let visitedNodes = visited[end].1

for i in 1...10000 {
    visited[i].0 = false
    visited[i].1.removeAll()
}

for i in 0..<visitedNodes.count {
    let x = visitedNodes[i]
    visited[x].0 = true
}
visited[start].0 = false
visited[end].0 = false
bfs(end, start)
back = visited[start].1.count - 1

let totalPathLength = go + back
print(totalPathLength)
