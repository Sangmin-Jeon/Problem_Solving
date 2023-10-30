import Foundation

// 입력
let n = Int(readLine()!) ?? 0
var meetings = [(Int, Int)]()
for _ in 0 ..< n {
    if let input = readLine() {
        let _time = input.split(separator: " ").map({ Int($0)! })
        meetings.append((_time.first!, _time.last!))
    }
}

// 시작 순으로 정렬, 시작 시간 같으면 끝 시간순으로 정렬
meetings.sort(by: {
    if $0.0 == $1.0 {
        return $0.1 < $1.1
    }
    return $0.0 < $1.0
})

// 우선 순위 Queue 선언 및 초기 설정
var pQueue = PriorityQueue<Int>(order: <)
pQueue.enqueue(meetings.removeFirst().1) // queue에는 끝 시간을 담음

for meet in meetings {
    if meet.0 >= pQueue.peek()! {
        let _ = pQueue.dequeue()
        pQueue.enqueue(meet.1)
        continue
    }
    pQueue.enqueue(meet.1)
}

// 출력
print(pQueue.count)

// MARK: 우선순위 Queue 구현 부 
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
            } 
            else {
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