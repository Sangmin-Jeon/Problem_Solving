import Foundation

func solution(_ numbers:String) -> Int {
    var n = numbers.map({ String($0) })
    n.sort(by: >)
    var visited = Array(repeating: false, count: n.count)
    var list = [String]()
    combination(n: n, list: &list, visited: &visited)
    return memo.count
}

var memo = [Int: Bool]()

func combination(n: [String], list: inout [String], visited: inout [Bool]) {
    if let sumList = Int(list.reduce("", +)) {
        if let _ = memo[sumList] {
            return
        }
        
        if sumList.isPrimeNum() {
            memo.updateValue(true, forKey: sumList)
        }
    }
    
    if list.count == n.count {
        return
    }
    
    for i in 0 ..< n.count {
        if !visited[i] {
            visited[i] = true
            list.append(n[i])
            combination(n: n, list: &list, visited: &visited)
            list.removeLast()
            visited[i] = false
        }
    }
}

extension Int {
    // 소수 판별
    func isPrimeNum() -> Bool {
        if self >= 0 {
            if self < 2 {
                return false
            }
            for i in 2 ..< Int(sqrt(Double(self)) + 1) {
                if self % i == 0 {
                    return false
                }
            }
            return true
        }
        return false
    }
}