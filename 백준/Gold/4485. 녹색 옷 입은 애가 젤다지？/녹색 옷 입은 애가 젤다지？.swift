import Foundation

struct Node: Hashable, Comparable {
    let row: Int
    let col: Int
    let cost: Int

    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.cost < rhs.cost
    }
}

var pCnt = 1
while true {
    if let input = readLine(), let N = Int(input), N > 0 {
        var cave = [[Int]]()
        for _ in 0 ..< N {
            if let row = readLine() {
                let rowValues = row.split(separator: " ").compactMap { Int($0) }
                cave.append(rowValues)
            }
        }
        let answer = zeldaAndLink(n: N, cave: cave)
        print("Problem \(pCnt): \(answer)")
        pCnt += 1
    }
    else {
        break
    }
}

func zeldaAndLink(n: Int, cave: [[Int]]) -> Int {
    var costs = Array(repeating: Array(repeating: false, count: n), count: n)
    var pQueue = PriorityQueue<Node>(order: <)

    let dr = [1, 0, -1, 0]
    let dc = [0, 1, 0, -1]

    var rupee = Int.max

    pQueue.enqueue(Node(row: 0, col: 0, cost: cave[0][0]))
    costs[0][0] = true

    while !pQueue.isEmpty {
        // pQueue = pQueue.sorted(by: { $0.cost < $1.cost })
        let dequeue = pQueue.dequeue()!
        let cur_row = dequeue.row
        let cur_col = dequeue.col
        let cost = dequeue.cost
        
        costs[cur_row][cur_col] = true
    
        if cur_row == (n - 1), cur_col == (n - 1) {
            rupee = cost
            break
        }

        for i in 0 ..< 4 {
            let row = cur_row + dr[i]
            let col = cur_col + dc[i]

            if row >= 0, col >= 0, n > row, n > col, !costs[row][col] {
                let _cost = cost + cave[row][col]
                pQueue.enqueue(Node(row: row, col: col, cost: _cost))
            }

        }

    }

    return rupee

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
