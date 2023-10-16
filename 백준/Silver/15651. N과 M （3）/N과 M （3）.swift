import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let n = line[0]
let m = line[1]

var sequence = Array(1 ... n)
var list = [Int]()
var answer = ""

NAndM(d: 0)
print(answer)

func NAndM(d: Int) {
    if d ==  m {
        answer += list.map { String($0) }.joined(separator: " ") + String("\n")
        return
    }

    for num in sequence {
        list.append(num)
        NAndM(d: d + 1)
        list.removeLast()
    }
}