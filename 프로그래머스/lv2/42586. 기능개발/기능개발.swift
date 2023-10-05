import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var answer = [Int]()
    var queue = [Int]()
    for i in 0 ..< progresses.count {
        let total = (100 - progresses[i])
        var days = total / speeds[i]
        if total % speeds[i] > 0 {
            days += 1
        }
        queue.append(days)
    }

    var stack = [Int]()
    stack.append(queue.removeFirst())

    while !queue.isEmpty {
        let pop = queue.removeFirst()
        if stack.first! >= pop {
            stack.append(pop)
            continue
        }
        answer.append(stack.count)
        stack = []
        stack.append(pop)

    }
    
    if stack.count > 0  {
        answer.append(stack.count)
    }
    
    return answer
}