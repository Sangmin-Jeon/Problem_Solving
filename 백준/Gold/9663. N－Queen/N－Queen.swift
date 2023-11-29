import Foundation

let n = Int(readLine()!) ?? 0
var answer = 0

var column = Array(repeating: false, count: n)
var diag1 = Array(repeating: false, count: 2 * n)
var diag2 = Array(repeating: false, count: 2 * n)

func setNQueens(r: Int) {
    if r == n {
        answer += 1
        return
    }

    for i in 0 ..< n {
        if column[i] || diag1[r + i] || diag2[r - i + n] {
            continue
        }

        // 퀸을 배치하고 다음 행으로 이동
        column[i] = true
        diag1[r + i] = true
        diag2[r - i + n] = true

        setNQueens(r: r + 1)

        // 퀸을 제거하고 다른 위치에 배치를 시도
        column[i] = false
        diag1[r + i] = false
        diag2[r - i + n] = false
    }
}

setNQueens(r: 0)
print(answer)
