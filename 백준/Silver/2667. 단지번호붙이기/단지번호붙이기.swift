import Foundation

// 입력
let n = Int(readLine()!) ?? 0

var townMap = [[Int]]()

for _ in 0 ..< n {
    if let row = readLine() {
        let rowArray = row.compactMap { Int(String($0)) }
        if rowArray.count == n {
            townMap.append(rowArray)
        }
    }
}

var answer = [Int]()
var visited = Array(repeating: Array(repeating: false, count: n), count: n)

for r in 0 ..< n {
    for c in 0 ..< n {
        if townMap[r][c] == 1, !visited[r][c] {
            answer.append(graphBFS(r: r, c: c))
        }
    }
}

// 출력
answer.sort()
print(answer.count)
for house in answer {
    print(house)
}

func graphBFS(r: Int, c: Int) -> Int {
    var queue = [(r: Int, c: Int)]()
    var answer = 1

    let dr = [0, 1, -1, 0]
    let dc = [1, 0 , 0, -1]

    queue.append((r: r, c: c))
    visited[r][c] = true

    while !queue.isEmpty {
        let visit = queue.removeFirst()
        let (_r, _c) = visit

        for i in 0 ..< 4 {
            let _dr = _r + dr[i]
            let _dc = _c + dc[i]

            if _dr >= 0, _dc >= 0, n > _dr, n > _dc, !visited[_dr][_dc], townMap[_dr][_dc] == 1 {
                queue.append((r: _dr, c: _dc))
                visited[_dr][_dc] = true
                answer += 1
            }
        }

    }

    return answer

}