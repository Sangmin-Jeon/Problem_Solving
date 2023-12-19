import Foundation

var answer = [Int: Int]()
var graph = [Int: [Int]]()

func makeGraph(_ edge: [[Int]]) {
    for e in edge {
        graph[e[0], default: []].append(e[1])
        graph[e[1], default: []].append(e[0])
    }
}

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    makeGraph(edge)
    BFS(n, edge)
    return answer[answer.keys.max()!]!
}

func BFS(_ n: Int, _ edge: [[Int]]) {
    var queue = [(node: Int, depth: Int)]()
    queue.append((node: 1, depth: 1))

    var visited = Array(repeating: false, count: n + 1)
    visited[1] = true

    while !queue.isEmpty {
        let visit = queue.removeFirst()

        answer[visit.depth, default: 0] += 1

        for node in graph[visit.node]! {
            if !visited[node] {
                queue.append((node: node, depth: visit.depth + 1))
                visited[node] = true
            }
        }
    }

}

