import Foundation

let N = Int(readLine()!)!
var number = Array(repeating: 0, count: N)
var visited = Array(repeating: false, count: N)

var memo = [String: Bool]()

func isPrimeNumber(_ n: Int) -> Bool {
    if n < 2 {
        return false
    }
    for i in 2 ..< Int(sqrt(Double(n)) + 1) {
        if n % i == 0 { 
            return false 
        }
    }
    return true
}

func DFS(_ number: Int, _ d: Int) {
    if d == N {
        print(number)
        return
    }

    for i in 1 ..< 10 {
        if isPrimeNumber(number * 10 + i) {
            DFS(number * 10 + i, d + 1)
        }
    }
}

for n in [2, 3, 5, 7] {
    DFS(n, 1)
}

