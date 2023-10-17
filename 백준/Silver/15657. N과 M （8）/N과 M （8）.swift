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

var list = [String]()

var result = ""

NAndM(depth: 0, index: 0)

print(result)

func NAndM(depth: Int, index: Int) {
    if depth == m {
        result += list.joined(separator: " ") + String("\n")
        return
    }

    for num in index ..< n {
        list.append(String(sequence[num]))
        NAndM(depth: depth + 1, index: num)
        list.removeLast()
    }
}