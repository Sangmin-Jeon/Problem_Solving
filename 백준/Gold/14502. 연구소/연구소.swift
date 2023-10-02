struct Position: Hashable {
    let row: Int
    let col: Int
}

func buildingLabWall(labMap: [[Int]], n: Int, m: Int) -> Int {
    let emptySpace = getEmptySpace(labMap: labMap, n: n, m: m)
    let combList = combination(emptySpace: emptySpace)
    var safeArea = 0
    for list in combList {
        var buildWall = labMap
        for i in 0 ..< 3 {
            buildWall[list[i].row][list[i].col] = 1
        }
        let new = bfs(buildWall, n, m)
        safeArea = max(safeArea, new)
    }   

    return safeArea

}

func bfs(_ labMap: [[Int]], _ n: Int, _ m: Int) -> Int {
    let dr = [1, 0 , -1, 0]
    let dc = [0, 1,  0, -1]
    var queue = [Position]()
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)

    // 연구실 맵에서 2 찾기
    for i in 0 ..< n {
        for j in 0 ..< m {
            if labMap[i][j] == 1 {
                visited[i][j] = true
            }
            if labMap[i][j] == 2 {
                queue.append(Position(row: i, col: j))
                visited[i][j] = true
            }
        }
    }

    // 그래프 BFS 
    while !queue.isEmpty {
        let visit = queue.removeFirst()
        let r = visit.row
        let c = visit.col

        for i in 0 ..< 4 {
            let _r = r + dr[i]
            let _c = c + dc[i]
            
            if _r >= 0, _c >= 0, n > _r, m > _c,
             !visited[_r][_c], labMap[_r][_c] == 0 {
                    queue.append(Position(row: _r, col: _c))
                    visited[_r][_c] = true
            }
        }
    }
    var safeCell = 0
    for i in 0 ..< n {
        for j in 0 ..< m {
            if !visited[i][j] {
                safeCell += 1
            }
        }
    }
    return safeCell
}

func combination(emptySpace: [(Position, Int)]) -> [[Position]] {
    var visited = Array(repeating: false, count: emptySpace.count)
    var temp = [(Position)]()
    var combList = [[(Position)]]()

    func dfs(depth: Int) {
        if depth == 3 {
            combList.append(temp)
            return
        }
        for (index, space) in emptySpace.enumerated() {
            if !visited[index] {
                visited[index] = true
                temp.append(space.0)
                dfs(depth: (depth + 1))
                temp.removeLast()
                visited[index] = false
            }
        }
    }

    dfs(depth: 0)
    return combList
    
}

func getEmptySpace(labMap: [[Int]], n: Int, m: Int) -> [(Position, Int)] {
    var hash = [(Position, Int)]()
    for r in 0 ..< n {
        for c in 0 ..< m {
            if labMap[r][c] == 0 {
                let position = Position(row: r, col: c)
                hash.append((position, 0))
            }
        }
    }
    return hash
}

// MARK: 입력
let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
let n = firstLine[0]
let m = firstLine[1]

var labMap: [[Int]] = []

for _ in 0..<n{
    labMap.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
}
let sol = buildingLabWall(labMap: labMap, n: n, m: m)
print(sol)