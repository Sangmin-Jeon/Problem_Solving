import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var answer = 0
    let sortedCosts = costs.sorted { $0[2] < $1[2] }
    var link = Set([sortedCosts[0][0]])

    // Kruskal 알고리즘으로 최소 비용 구하기
    while link.count != n {
        for v in sortedCosts {
            if link.contains(v[0]), link.contains(v[1]) {
                continue
            }
            if link.contains(v[0]) || link.contains(v[1]) {
                link.insert(v[0])
                link.insert(v[1])
                answer += v[2]
                break
            }
        }
    }

    return answer
    
}

