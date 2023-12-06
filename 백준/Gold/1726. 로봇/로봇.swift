import Foundation

// 입력 처리 함수
func readLineToArray() -> [Int] {
    return readLine()!.split(separator: " ").map { Int($0)! }
}

func bfs(s_y: Int, s_x: Int, s_d: Int) -> Int {
    var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: 4), count: m), count: n)
    visited[s_y][s_x][s_d] = 1
    var q = [(s_y, s_x, s_d, 0)]
    var index = 0

    while index < q.count {
        let (y, x, d, cnt) = q[index]
        index += 1
        if y == a_y && x == a_x && d == a_d { return cnt }

        for step in 1...3 {
            let dy = y + my[d] * step
            let dx = x + mx[d] * step
            if dy < 0 || dy >= n || dx < 0 || dx >= m || matrix[dy][dx] == 1 { break }
            if visited[dy][dx][d] == 0 {
                visited[dy][dx][d] = 1
                q.append((dy, dx, d, cnt + 1))
            }
        }

        for r_d in rotate[d]! {
            if visited[y][x][r_d] == 0 {
                visited[y][x][r_d] = 1
                q.append((y, x, r_d, cnt + 1))
            }
        }
    }
    return -1
}

let inputs = readLineToArray()
let n = inputs[0]
let m = inputs[1]
var matrix = [[Int]]()

for _ in 0..<n {
    matrix.append(readLineToArray())
}

var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: 4), count: m), count: n)

let my = [0, 0, 1, -1]
let mx = [1, -1, 0, 0]
let rotate: [Int: [Int]] = [0: [2, 3], 1: [2, 3], 2: [0, 1], 3: [0, 1]]

let start = readLineToArray()
let end = readLineToArray()

let s_y = start[0] - 1
let s_x = start[1] - 1
let s_d = start[2] - 1
let a_y = end[0] - 1
let a_x = end[1] - 1
let a_d = end[2] - 1

print(bfs(s_y: s_y, s_x: s_x, s_d: s_d))
