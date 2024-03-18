import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var answer = [Int](repeating: -1, count: numbers.count) 
    var stack: [Int] = [] 

   
    for i in (0 ..< numbers.count).reversed() {
        while !stack.isEmpty, numbers[stack.last!] <= numbers[i] {
            stack.removeLast()
        }

        if !stack.isEmpty {
            answer[i] = numbers[stack.last!]
        }

        stack.append(i)
    }

    return answer
}