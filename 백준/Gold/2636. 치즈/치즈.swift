import Foundation

// 입력
let input = readLine()!.split(separator: " ").map({ Int(String($0)) ?? 0 })
let row = input.first ?? 0
let col = input.last ?? 0

var graph = [[Int]]()

for _ in 0 ..< row {
    graph.append(readLine()!.split(separator: " ").map{ Int(String($0)) ?? 0 })
}

func meltCheese() -> (Int, Int) {
    var answer = [Int]()
    var time = 0

    for i in 0 ..< row {
        for j in 0 ..< col {
            if graph[i][j] == 0 {
                let cheese = bfs(r: i, c: j)
                if cheese == 0 {
                    return (time, answer.last ?? 0)
                }
                time += 1
                answer.append(cheese)
            }
        }
    }

    return (0, 0)
}


func bfs(r: Int,  c: Int) -> Int {
    var answer = 0

    var queue = [(Int, Int)]()
    queue.append((r, c))

    var visited = Array(repeating: Array(repeating: false, count: col), count: row)
    visited[r][c] = true

    let dr = [0, 1, 0 , -1]
    let dc = [1, 0, -1 , 0]

    while !queue.isEmpty {
        let visit = queue.removeFirst()
        let (_r, _c) = visit

        for i in 0 ..< 4 {
            let _dr = _r + dr[i]
            let _dc = _c + dc[i]

            if _dr >= 0, _dc >= 0, row > _dr, col > _dc, !visited[_dr][_dc] {
                if graph[_dr][_dc] == 0 {
                    queue.append((_dr, _dc))
                }
                else {
                    graph[_dr][_dc] = 0
                    answer += 1
                }
                visited[_dr][_dc] = true
            }
        }

    }

    return answer
    
}


// 출력
let sol = meltCheese()
print(sol.0)
print(sol.1)