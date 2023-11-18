import Foundation

let input = readLine()!.split(separator: " ").map({ Int($0)! })
let n = input[0]
let m = input[1]

var graph = [Int: [(node: Int, cost: Int)]]()

for _ in 0 ..< m {
    let t = readLine()!.split(separator: " ").map({ Int($0)! })
    if graph[t[0]] == nil {
        graph[t[0]] = [(node: t[1], cost: t[2])]
    }
    else {
        var buf = graph[t[0]]! + [(node: t[1], cost: t[2])]
        buf = buf.sorted(by: { $0.cost < $1.cost })
        graph[t[0]] = buf
    }
    
    if graph[t[1]] == nil {
        graph[t[1]] = [(node: t[0], cost: t[2])]
    }
    else {
        var buf = graph[t[1]]! + [(node: t[0], cost: t[2])]
        buf = buf.sorted(by: { $0.cost < $1.cost })
        graph[t[1]] = buf
    }
    
}

func courierDelivery() -> Int {
    dijkstra(1)
}

let answer = courierDelivery()
print(answer)

struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.cost < rhs.cost
    }
    let node: Int
    let cost: Int
}

func dijkstra(_ start: Int) -> Int {
    var pQueue = PriorityQueue<Node>(order: < )
    pQueue.enqueue(Node(node: start, cost: 0))
    var visited = Array(repeating: false, count: n + 1)
    visited[start] = true

    while !pQueue.isEmpty {
        let visit = pQueue.dequeue()!
        let cur_node = visit.node
        let cur_cost = visit.cost
        
        visited[cur_node] = true
        
        if cur_node == n {
            return cur_cost
        }

        for (next_node, next_cost) in graph[cur_node]! {
            if !visited[next_node] {
                pQueue.enqueue(Node(node: next_node, cost: cur_cost + next_cost))
                
            }
        }
    }
    
    return 0

}

struct PriorityQueue<T: Comparable> {
    var heap: [T] = []
    let order: (T, T) -> Bool
    
    init(order: @escaping (T, T) -> Bool) {
        self.order = order
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    var count: Int {
        return heap.count
    }
    
    mutating func enqueue(_ element: T) {
        heap.append(element)
        var currentIndex = heap.count - 1
        while currentIndex > 0 {
            let parentIndex = (currentIndex - 1) / 2
            if order(heap[currentIndex], heap[parentIndex]) {
                heap.swapAt(currentIndex, parentIndex)
                currentIndex = parentIndex
            } else {
                break
            }
        }
    }
    
    mutating func dequeue() -> T? {
        if heap.isEmpty {
            return nil
        }
        if heap.count == 1 {
            return heap.removeFirst()
        }
        let first = heap[0]
        heap[0] = heap.removeLast()
        var currentIndex = 0
        while true {
            let leftChildIndex = 2 * currentIndex + 1
            let rightChildIndex = 2 * currentIndex + 2
            var nextIndex = currentIndex
            if leftChildIndex < heap.count && order(heap[leftChildIndex], heap[nextIndex]) {
                nextIndex = leftChildIndex
            }
            if rightChildIndex < heap.count && order(heap[rightChildIndex], heap[nextIndex]) {
                nextIndex = rightChildIndex
            }
            if nextIndex == currentIndex {
                break
            }
            heap.swapAt(currentIndex, nextIndex)
            currentIndex = nextIndex
        }
        return first
    }
    
    func peek() -> T? {
        return heap.first
    }
}


