import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let n = line[0]
let m = line[1]

var sequence = Array(1 ... n)
var visited = Array(repeating: false, count: sequence.count)
var list = [Int]()
var answer = [String]()

NAndM()
for num in answer {
    // 여기서 열거하면서 정답 출력
    print(num)
}

func NAndM() {
    if list.count ==  m {
        let result = list.map { String($0) }.joined(separator: " ")
        answer.append(result)
        return
    }

    for num in sequence {
        var num = num
        if !visited[num - 1] {
            visited[num - 1] = true
            list.append(num)
            NAndM()
            list.removeLast()
            visited[num - 1] = false
        }
    }
}