func findCabbage(m: Int, n: Int, k: Int, location: [(Int, Int)]) -> Int {
    var land = Array(repeating: Array(repeating: false, count: m), count: n)
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    
    // 배추가 있는 위치 표시
    for loc in location {
        let (x, y) = loc
        land[y][x] = true
    }
    
    var result = 0
    
    for i in 0..<n {
        for j in 0..<m {
            if land[i][j], !visited[i][j] {
                bfs(&land, &visited, i, j)
                result += 1
            }
        }
    }
    
    return result
}

func bfs(_ land: inout [[Bool]], _ visited: inout [[Bool]], _ sR: Int, _ sC: Int) {
    let dr = [-1, 0, 1, 0]
    let dc = [0, 1, 0, -1]
    var queue = [(Int, Int)]()
    
    queue.append((sR, sC))
    visited[sR][sC] = true
    
    while !queue.isEmpty {
        let visit = queue.removeFirst()
        
        let (r, c) = visit
        
        for i in 0..<4 {
            let cdr = r + dr[i]
            let cdc = c + dc[i]
            
            if cdr >= 0, cdr < land.count, cdc >= 0, cdc < land[0].count,
               !visited[cdr][cdc], land[cdr][cdc] {
                queue.append((cdr, cdc))
                visited[cdr][cdc] = true
            }
        }
    }
}

// 테스트 케이스 개수 T를 읽어옵니다.
guard let testCaseCount = Int(readLine()!) else {
    fatalError("테스트 케이스 개수를 읽어올 수 없습니다.")
}

// 각 테스트 케이스에 대한 처리를 반복합니다.
for _ in 0..<testCaseCount {
    // 배추밭의 가로길이 M, 세로길이 N, 배추의 위치 개수 K를 읽어옵니다.
    guard let input = readLine()?.split(separator: " ").map({ Int($0)! }),
          input.count == 3 else {
        fatalError("배추밭 정보를 읽어올 수 없습니다.")
    }
    let M = input[0]
    let N = input[1]
    let K = input[2]
    
    // 배추의 위치 정보를 저장할 배열을 초기화합니다.
    var cabbageLocations: [(Int, Int)] = []
    
    // 배추의 위치 정보를 읽어와 배열에 저장합니다.
    for _ in 0..<K {
        guard let cabbageLocation = readLine()?.split(separator: " ").map({ Int($0)! }),
              cabbageLocation.count == 2 else {
            fatalError("배추의 위치 정보를 읽어올 수 없습니다.")
        }
        cabbageLocations.append((cabbageLocation[0], cabbageLocation[1]))
    }
    
    // 배추를 찾는 함수를 호출하고 결과를 출력합니다.
    let result = findCabbage(m: M, n: N, k: K, location: cabbageLocations)
    print(result)
}
