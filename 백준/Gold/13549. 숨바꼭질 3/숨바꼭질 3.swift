import Foundation

// 입력
let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
let N = input.first!
let K = input.last!

shortestPath(N, K)    

// 최단 경로 BFS
func shortestPath(_ n: Int, _ k: Int) {
    var queue = [Node]()
    queue.append(Node(node: n, cost: 0))

    var visited = [Bool](repeating: false, count: 100001)

    // BFS
    while !queue.isEmpty {
        let visit = queue.removeFirst()
        let cur = visit.node
        let time = visit.cost

        if cur == K {
            print(time) // 도착
            break
        }

        if cur * 2 < 100001, !visited[cur * 2] { // 순간이동
            queue.append(Node(node: cur * 2, cost: time))
            visited[cur * 2] = true
        }
        if 0 <= cur - 1, !visited[cur - 1] { // 한칸 -1
            queue.append(Node(node: cur - 1, cost: time + 1))
            visited[cur - 1] = true
        }
        if cur + 1 < 100001, !visited[cur + 1] { // 한칸 +1
            queue.append(Node(node: cur + 1, cost: time + 1))
            visited[cur + 1] = true
        }
    }

}

// 우선순위 큐 구현
struct Node: Hashable, Comparable {
    let node: Int
    let cost: Int

    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.cost < rhs.cost
    }
}
