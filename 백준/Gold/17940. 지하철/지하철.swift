import Foundation

struct Station: Comparable {
    static func < (lhs: Station, rhs: Station) -> Bool {
        if lhs.node == rhs.node {
            return lhs.cost < rhs.cost
        }
        return lhs.node < rhs.node
    }
    let node: Int
    let cost: Int
}

func findShortestSubwayRoute() -> Int {
    var dist = Array(repeating: INF, count: stationCnt)
    var pQueue = PriorityQueue<Station>(order: { $0.node < $1.node } )
    pQueue.enqueue(Station(node: 0, cost: 0))
    dist[0] = 0

    while !pQueue.isEmpty {
        let visit = pQueue.dequeue()!
        let cost = -visit.cost
        let now = visit.node
        
        
        if dist[now] < cost {
            continue
        }

        for i in graph[now] {
            let nextNode = i.0
            let nextDist = i.1 + cost
            if nextDist < dist[nextNode] {
                dist[nextNode] = nextDist
                pQueue.enqueue(Station(node: nextNode, cost: -Int(exactly: nextDist)!))
            }
        }
        
    }
    
    return dist[destination]

}

let input = readLine()!.split(separator: " ").map({ Int($0)! })
let stationCnt = input[0]
let destination = input[1]
var corpInfo = [Int]()
for _ in 0 ..< stationCnt {
    corpInfo.append(Int(readLine()!)!)
}
var graph = Array(repeating: [(Int, Int)](), count: 1000)
let IMP = 1000000
let INF = 987654321

for i in 0 ..< stationCnt {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 0 ..< stationCnt {
        let buf = row[j]
        if buf != 0 {
            if corpInfo[i] == corpInfo[j] {
                graph[i].append((j, buf))
            }
            else {
                graph[i].append((j, buf + IMP))
            }
        }
    }
}

let answer = findShortestSubwayRoute()
print("\(answer / IMP) \(answer % IMP)")

// MARK: 우선순위 큐 구현 부
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


