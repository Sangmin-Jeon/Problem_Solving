import Foundation

func solution(_ n:Int) -> Int {
    var n = n
    var answer = 0

    while n > 0 {
        if n % 2 != 0 {
            answer += 1
        }
        n /= 2
    }

    return answer
}