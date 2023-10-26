import Foundation

// MARK: 우선순위 큐
struct PriorityQueue<T: Comparable> {
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

let n = Int(readLine()!) ?? 0
var lectures = [(Int, Int)]()

for _ in 0 ..< n {
    if let input = readLine() {
        let times = input.split(separator: " ").compactMap { Int($0) }
        if times.count == 2 {
            lectures.append((times[0], times[1]))
        }
    }
}

lectures.sort { (a: (Int, Int), b :(Int, Int)) -> Bool in
    if a.0 == b.0 {
        return a.1 < b.1
    }
    else {
        return a.0 < b.0
    }
}


var pQueue = PriorityQueue<Int>(order: <)
pQueue.enqueue(lectures.removeFirst().1)

for l in lectures {
    if l.0 >= pQueue.peek()! {
        let _ = pQueue.dequeue()
        pQueue.enqueue(l.1)
    }
    else {
        pQueue.enqueue(l.1)
    }

}

print(pQueue.count)


