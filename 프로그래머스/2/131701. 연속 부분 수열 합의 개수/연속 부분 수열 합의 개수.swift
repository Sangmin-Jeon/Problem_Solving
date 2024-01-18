import Foundation

func solution(_ elements: [Int]) -> Int {
    let cnt = elements.count
    var sums = Array(repeating: 0, count: cnt + 1)
    var answer = Set<Int>()

    for i in 0 ..< cnt {
        sums[i + 1] = sums[i] + elements[i]
    }

    for len in 1...cnt {
        for s in 0 ..< cnt {
            var e = s + len
            if e > cnt {
                e -= cnt
                answer.insert(sums[cnt] - sums[s] + sums[e])
            } else {
                answer.insert(sums[e] - sums[s])
            }
        }
    }

    return answer.count
}