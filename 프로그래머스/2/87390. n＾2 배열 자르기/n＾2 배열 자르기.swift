import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    let l = Int(left)
    let r = Int(right)

    var arr = [Int](repeating: 0, count: (r - l) + 1)

    for i in l ... r {
        arr[i - l] = max((i / n) + 1, i % n + 1)
    }

    return arr
}