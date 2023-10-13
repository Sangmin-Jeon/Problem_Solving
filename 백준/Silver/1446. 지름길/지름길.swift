import Foundation

func dijkstra(start: Int, d: Int, shortcuts: inout [[(node: Int, weight: Int)]]) -> Int {
    var pQueue = PriorityQueue<Node>(order: <)
    pQueue.enqueue(Node(cost: 0, node: start))
    var distance = Array(repeating: Int.max, count: d + 1)
    distance[start] = 0
    
    while !pQueue.isEmpty {
        if let visit = pQueue.dequeue() {
            let cur_cost = visit.cost
            let cur_node = visit.node
            
            if cur_cost > distance[cur_node] {
                continue
            }

            for road in shortcuts[cur_node] {
                let cost = cur_cost + road.weight
                if cost < distance[road.node] {
                    distance[road.node] = cost
                    pQueue.enqueue(Node(cost: cost, node: road.node))
                }
            }
        }
    }

    return distance[d]
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let d = input[1]
var graph = [[(node: Int, weight: Int)]](repeating: [(node: Int, weight: Int)](), count: d + 1)

for i in 0 ..< d {
    graph[i].append((i + 1, 1))
}

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let s = line[0]
    let e = line[1]
    let l = line[2]

    if e > d {
        continue
    }

    graph[s].append((e, l))
}

let result = dijkstra(start: 0, d: d, shortcuts: &graph)
print(result)

struct Node: Hashable, Comparable {
    let cost: Int
    let node: Int

    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.cost < rhs.cost
    }
}

public struct PriorityQueue<T: Comparable> {
    private var heap: [T] = []
    private let order: (T, T) -> Bool
    
    public init(order: @escaping (T, T) -> Bool) {
        self.order = order
    }
    
    public var isEmpty: Bool {
        return heap.isEmpty
    }
    
    public var count: Int {
        return heap.count
    }
    
    public mutating func enqueue(_ element: T) {
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
    
    public mutating func dequeue() -> T? {
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
    
    public func peek() -> T? {
        return heap.first
    }
}