import Foundation

func getSubTotal(_ N: Int, _ S: Int, _ seq: [Int]) -> Int {
    var answer = Int.max
    var left = 0, right = 0, sum = 0

    while true {
        if sum >= S {
            answer = min(answer, right - left)
            sum -= seq[left]
            left += 1
        }
        else if right == N {
            break
        }
        else {
            sum += seq[right]
            right += 1
        }
    }
    return answer == Int.max ? 0 : answer
}

let input = readLine()!.split(separator: " ").map({ Int($0)! })
let N = input[0]
let S = input[1]
let seq = readLine()!.split(separator: " ").map({ Int($0)! })
print(getSubTotal(N, S, seq))
