import Foundation

// 모든 토마토가 익었는지 안익었는지 확인
func checkBox(tomatoBox: [[Int]]) -> Bool {
    for tomato in tomatoBox {
        if tomato.contains(0) {
            return true
        }
    }
    
    return false
}

// 토마토 박스
func tomato(n: Int, m: Int, tomatoBox: [[Int]]) -> Int {
    if !checkBox(tomatoBox: tomatoBox) {
        return 0
    }
    
    var tomatoBox = tomatoBox
    var queue = [(r: Int, c: Int, l: Int)]()

    for i in 0 ..< n {
        for j in 0 ..< m {
            if tomatoBox[i][j] == 1 {
                queue.append((r: i, c: j, l: 1))
            }
        }
    }
    
    let result = graphBfs(queue: &queue, tomatoBox: &tomatoBox)
    return checkBox(tomatoBox: tomatoBox) ? -1 : result
    
}

// 그래프 BFS로 탐색
func graphBfs(queue: inout [(r: Int, c: Int, l: Int)], tomatoBox: inout [[Int]]) -> Int{
    // 상, 하, 좌, 우
    let dr = [-1, 0, 1, 0]
    let dc = [0, 1, 0, -1]
    var count_day = -1
    var index = 0
    
    while index < queue.count {
        let visit = queue[index]
        let (r, c, l) = visit
        
        index += 1
        
        for i in 0 ..< 4 {
            let _dr = r + dr[i]
            let _dc = c + dc[i]
            
            if _dr >= 0, _dc >= 0,
               tomatoBox.count > _dr, tomatoBox.first!.count > _dc,
               tomatoBox[_dr][_dc] == 0 {
                queue.append((r: _dr, c: _dc, l: l+1))
                tomatoBox[_dr][_dc] = 1 // 방문시 1으로
                count_day = l
            }
        }
    }
    
    return count_day
}

// MARK: 입력
let dimensions = readLine()!.split(separator: " ").map { Int($0)! }
let M = dimensions[0] // 상자의 가로 칸의 수
let N = dimensions[1] // 상자의 세로 칸의 수

var tomatoBox = [[Int]]()

for _ in 0 ..< N {
    if let row = readLine() {
        let rowArray = row.split(separator: " ").map { Int($0) ?? 0 }
        if rowArray.count == M {
            tomatoBox.append(rowArray)
        }
    }
}
let sol = tomato(n: N, m: M, tomatoBox: tomatoBox)
print(sol)