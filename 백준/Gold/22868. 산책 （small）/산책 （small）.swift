import Foundation

// 입력에서 읽어온 노드 수를 저장
let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]

// 그래프와 visited 배열을 동적으로 생성
var graph = [[Int]](repeating: [], count: N + 1)
var visited = [[Int]](repeating: [], count: N + 1)

var start = 0
var end = 0

func bfs(_ s: Int, _ e: Int) {
    var queue = [Int]()
    queue.append(s)
    visited[s] = [s]

    while !queue.isEmpty {
        let visit = queue.removeFirst()

        if visit == e {
            return
        }

        graph[visit].sort()

        for i in 0..<graph[visit].count {
            let new_visit = graph[visit][i]
            if visited[new_visit].isEmpty {
                visited[new_visit] = visited[visit] + [new_visit]
                queue.append(new_visit)
            }
        }
    }
}

for _ in 1 ... M {
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
go = visited[end].count - 1
let visitedNodes = visited[end]

// visited 배열 초기화
for i in 1 ... N {
    visited[i] = []
}

for i in 0 ..< visitedNodes.count {
    let visit = visitedNodes[i]
    visited[visit] = [visit]
}

visited[start] = []
visited[end] = []
bfs(end, start)
back = visited[start].count - 1

let totalPathLength = go + back
print(totalPathLength)