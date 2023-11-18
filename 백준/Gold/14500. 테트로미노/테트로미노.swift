import Foundation

var board: [[Int]] = []
var visited: [[Bool]] = []
let moves: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]  // 상, 하, 좌, 우
var maxValue = 0

// ㅗ, ㅜ, ㅓ, ㅏ 모양 제외한 모양들 최대값 계산
func dfs(i: Int, j: Int, dsum: Int, cnt: Int) {
    if cnt == 4 {
        maxValue = max(maxValue, dsum)
        return
    }

    for n in 0..<4 {
        let ni = i + moves[n].0
        let nj = j + moves[n].1
        if ni >= 0 && ni < board.count && nj >= 0 && nj < board[0].count && !visited[ni][nj] {
            visited[ni][nj] = true
            dfs(i: ni, j: nj, dsum: dsum + board[ni][nj], cnt: cnt + 1)
            visited[ni][nj] = false
        }
    }
}

// ㅗ, ㅜ, ㅓ, ㅏ 모양의 최대값 계산
func exce(i: Int, j: Int) {
    for n in 0..<4 {
        var temp = board[i][j]
        for k in 0..<3 {
            let t = (n + k) % 4
            let ni = i + moves[t].0
            let nj = j + moves[t].1

            if ni < 0 || ni >= board.count || nj < 0 || nj >= board[0].count {
                temp = 0
                break
            }
            temp += board[ni][nj]
        }
        maxValue = max(maxValue, temp)
    }
}

// 입력 처리 및 실행
func solve() {
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let (N, M) = (firstLine[0], firstLine[1])

    board = (0..<N).map { _ in readLine()!.split(separator: " ").map { Int($0)! } }
    visited = Array(repeating: Array(repeating: false, count: M), count: N)

    for i in 0..<N {
        for j in 0..<M {
            visited[i][j] = true
            dfs(i: i, j: j, dsum: board[i][j], cnt: 1)
            visited[i][j] = false
            exce(i: i, j: j)
        }
    }

    print(maxValue)
}

solve()

