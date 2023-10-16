import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let n = line[0]
let m = line[1]

var sequence = Array(1 ... n)
var visited = Array(repeating: false, count: sequence.count)
var list = [Int]()
var answer = [String]()

NAndM(i: 0)
for num in answer {
    // 여기서 열거하면서 정답 출력
    print(num)
}

func NAndM(i: Int) {
    if list.count == m {
        let result = list.map { String($0) }.joined(separator: " ")
        answer.append(result)
        return
    }

    for num in i ..< sequence.count {
        list.append(sequence[num])
        NAndM(i: num + 1)
        list.removeLast()
    }
}