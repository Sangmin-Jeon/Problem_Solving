import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let n = line[0]
let m = line[1]

var sequence = [Int]()
let arr = readLine()!.split(separator: " ").map { Int($0)! }
arr.forEach({ item in
    sequence.append(item)
})

sequence.sort()

var visited = Array(repeating: false, count: sequence.count)
var list = [Int]()

NAndM(depth: 0, index: 0)

func NAndM(depth: Int, index: Int) {
    if depth == m {
        let result = list.map { String($0) }.joined(separator: " ")
        print(result)
        return
    }

    for num in index ..< n {
        list.append(sequence[num])
        NAndM(depth: depth + 1, index: num + 1)
        list.removeLast()
    }
}