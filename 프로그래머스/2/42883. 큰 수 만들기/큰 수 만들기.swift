import Foundation

func solution(_ number: String, _ k: Int) -> String {
    let num = number.map({ String($0) })
    let sNum = num.sorted(by: >)
    if sNum == num {
        return num[0..<num.count-k].reduce("", +)
    }
    return getMaxNumber(num: num, k: k)
}

func getMaxNumber(num: [String], k: Int) -> String {
    var stack = [String]()
    var count = 0

    for i in 0 ..< num.count {
        while !stack.isEmpty, count < k, stack.last! < num[i] {
            stack.removeLast()
            count += 1
        }   
        stack.append(num[i])
    }

    return stack.reduce("", +)

}