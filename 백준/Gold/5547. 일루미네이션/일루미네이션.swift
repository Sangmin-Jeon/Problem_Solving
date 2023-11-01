import Foundation

func setGraph(r: Int, c: Int) -> [[Int]] {
    var graph = Array(repeating: Array(repeating: 0, count: r + 2), count: c + 2)
    for i in 1 ... c {
        let row = readLine()!.split(separator: " ").map{Int(String($0))!}
        graph[i][1 ... r] = row[0 ..< r]
    }

    return graph

}

func graphBFS(graph: [[Int]], visited: inout [[Bool]]) -> Int {
    var wallCnt = 0
    let dr = [-1, -1, 0, 1, 1, 0]
    let even_dc = [-1, 0, 1, 0, -1, -1]
    let odd_dc = [0, 1, 1, 1, 0, -1]
    var queue = [(r: Int, c: Int)]()

    queue.append((r: 0, c: 0))
    visited[0][0] = true

    while !queue.isEmpty {
        let visit = queue.removeFirst()
        let (_r, _c) = visit
        
        for i in 0 ..< 6 {
            let _dr = _r + dr[i]
            var _dc = 0
            if _r % 2 == 0 {
                _dc = _c + even_dc[i] 
            }
            else {
                _dc = _c + odd_dc[i]
            }

            if _dr >= 0, _dc >= 0, (col + 2) > _dr, (row + 2) > _dc, !visited[_dr][_dc] {
                if graph[_dr][_dc] == 0 {
                    queue.append((r: _dr, c: _dc))
                    visited[_dr][_dc] = true
                }
                else {
                    wallCnt += 1
                }
            }
        }
    }

    return wallCnt

}

let input = readLine()!.split(separator: " ").map({ Int($0)! })
let row = input[0]
let col = input[1]

var visited = Array(repeating: Array(repeating: false, count: row + 2), count: col + 2)
let answer = graphBFS(graph: setGraph(r: row, c: col), visited: &visited)
print(answer)