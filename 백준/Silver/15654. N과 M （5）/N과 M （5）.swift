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

NAndM(depth: 0)

func NAndM(depth: Int) {
    if depth == m {
        let result = list.map { String($0) }.joined(separator: " ")
        print(result)
        return
    }

    for num in 0 ..< n {
        if !visited[num] {
            visited[num] = true
            list.append(sequence[num])
            NAndM(depth: depth + 1)
            list.removeLast() 
            visited[num] = false
        }
    }
}
