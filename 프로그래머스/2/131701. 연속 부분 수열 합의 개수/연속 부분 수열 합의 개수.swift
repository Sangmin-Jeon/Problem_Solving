import Foundation

func solution(_ elements: [Int]) -> Int {
    let 원소들 = elements
    let 총원소수 = 원소들.count
    var 누적합 = Array(repeating: 0, count: 총원소수 + 1)
    var 정답 = Set<Int>()

    for 인덱스 in 0 ..< 총원소수 {
        누적합[인덱스 + 1] = 누적합[인덱스] + 원소들[인덱스]
    }

    for 길이 in 1...총원소수 {
        for 시작 in 0 ..< 총원소수 {
            var 끝 = 시작 + 길이
            if 끝 > 총원소수 {
                끝 -= 총원소수
                정답.insert(누적합[총원소수] - 누적합[시작] + 누적합[끝])
            } else {
                정답.insert(누적합[끝] - 누적합[시작])
            }
        }
    }

    return 정답.count
}
