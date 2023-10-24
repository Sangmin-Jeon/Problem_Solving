import Foundation

let input = String(readLine()!).map({ String($0) })
let inputCnt = input.count

let polyominoA = "AAAA"
let polyominoB = "BB"

var list = [[String]]()
var queue = [String]()
for i in 0 ..< inputCnt {
    if let last = queue.last, last != String(input[i]) {
        list.append(queue)
        queue = []
    }
    queue.append(String(input[i]))

    if i == (inputCnt - 1) {
        list.append(queue)
        queue = []
    }
}

var answer = ""
for i in 0 ..< list.count {
    if list[i].first! == "." {
        answer += list[i].reduce("", +)
        continue
    }
    let pA = list[i].count / 4 
    let pB = list[i].count % 4 

    for _ in 0 ..< pA {
        answer += polyominoA
    }
    if pB > 1 {
        answer += polyominoB
    }
    if pB == 1 || pB == 3 {
        answer = "-1"
        break
    }

}
print(answer)