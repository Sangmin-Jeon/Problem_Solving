import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let n = line[0]
let m = line[1]

var sequence = [Int]()
let arr = readLine()!.split(separator: " ").map { Int($0)! }
arr.forEach({ item in
    sequence.append(item)
})

var memo = [[String]: Bool]()
sequence.sort()

let sequenceCnt = sequence.count

var visited = Array(repeating: false, count: sequenceCnt)

var list = [String]()
var result = ""

NAndM(depth: 0, index: 0)

print(result)

func NAndM(depth: Int, index: Int) {
    if let _ = memo[list] {
        return
    }

    if depth == m {
        memo.updateValue(true, forKey: list)
        result += list.joined(separator: " ") + String("\n")
        return
    }
    
    var prev = 0

    for num in index ..< sequenceCnt {
        if prev != sequence[num] {
            list.append(String(sequence[num]))
            prev = sequence[num]
            NAndM(depth: depth + 1, index: num)
            list.removeLast()
        }
    }
}