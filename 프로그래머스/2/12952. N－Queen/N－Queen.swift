import Foundation

var map = [Int]()
var answer = 0
var N = 0

func isPromising(r: Int) -> Bool {
    for i in 0 ..< r {
        if map[r] == map[i] || (r - i) == abs(map[r] - map[i]) {
            return false
        }
    }
    return true
}

func solution(_ n:Int) -> Int {
    N = n
    map = Array(repeating: -1, count: n)
    setNQueens(r: 0)
    return answer
}

func setNQueens(r: Int) {
    if r == N {
        answer += 1
        return
    }

    for c in 0 ..< N {
        map[r] = c
        if isPromising(r: r) {
            setNQueens(r: r + 1)
        }
    }
}
