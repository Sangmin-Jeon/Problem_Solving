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

NAndM(depth: 0)

print(result)

func NAndM(depth: Int) {
    if let _ = memo[list] {
        return
    }

    if depth == m {
        memo.updateValue(true, forKey: list)
        result += list.joined(separator: " ") + String("\n")
        return
    }

    for num in 0 ..< sequenceCnt {
        list.append(String(sequence[num]))
        NAndM(depth: depth + 1)
        list.removeLast()
    }
}