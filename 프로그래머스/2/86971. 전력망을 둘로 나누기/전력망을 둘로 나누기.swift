import Foundation

func setTree(_ wires: [[Int]]) -> [Int: [Int]] {
    var tree = [Int: [Int]]()
    for wire in wires {
        tree[wire[0], default: []].append(wire[1])
        tree[wire[1], default: []].append(wire[0])
    }
    return tree
}

func solution(_ n: Int, _ wires: [[Int]]) -> Int {
    var tree = setTree(wires)
    var minDiff = Int.max
    
    for edge in wires {
        let u = edge[0]
        let v = edge[1]
        
        // 간선 제거
        tree[u]?.removeAll(where: { $0 == v })
        tree[v]?.removeAll(where: { $0 == u })
        
        // BFS를 통해 두 부분 트리의 크기 차이 계산
        let diff = abs(bfs(u, tree) - bfs(v, tree))
        minDiff = min(minDiff, diff)
        
        // 간선 복구
        tree[u]?.append(v)
        tree[v]?.append(u)
    }
    
    return minDiff
}

func bfs(_ start: Int, _ graph: [Int: [Int]]) -> Int {
    var visited = Set<Int>()
    var queue = [start]
    visited.insert(start)
    var count = 0
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        count += 1
        
        if let neighbors = graph[node] {
            for neighbor in neighbors {
                if !visited.contains(neighbor) {
                    visited.insert(neighbor)
                    queue.append(neighbor)
                }
            }
        }
    }
    
    return count
}

