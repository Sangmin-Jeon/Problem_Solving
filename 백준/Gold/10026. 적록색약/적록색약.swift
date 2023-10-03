func colorArea(n: Int, grid: [[String]]) -> (Int, Int) {
    let rgb = ["R", "G", "B"]
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var rgbCnt = [Int]()
    var totalRgbCnt = [Int]()
    var isColorBlindness = false
    for color in rgb {
        var count = 0
        for r in 0 ..< n {
            for c in 0 ..< n {
                if !visited[r][c], grid[r][c] == color {
                    bfs(n: n, position: (r: r, c: c), grid: grid, color: color, visited: &visited, isColorBlindness: isColorBlindness)
                    count += 1
                }
            }
        }
        rgbCnt.append(count)
    }
    totalRgbCnt.append(rgbCnt.reduce(0, +))
    rgbCnt = []
    isColorBlindness = true
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
    for color in rgb {
        // if color == "G" {
        //     continue
        // }
        var count = 0
        for r in 0 ..< n {
            for c in 0 ..< n {
                if !visited[r][c], grid[r][c] == color {
                    bfs(n: n, position: (r: r, c: c), grid: grid, color: color, visited: &visited, isColorBlindness: isColorBlindness)
                    count += 1
                }
            }
        }
        rgbCnt.append(count)
    }
    totalRgbCnt.append(rgbCnt.reduce(0, +))

    return (totalRgbCnt.first!, totalRgbCnt.last!)
}


func bfs(n: Int, position: (r: Int, c: Int), grid: [[String]], color: String, visited: inout [[Bool]], isColorBlindness: Bool) {
    var queue = [(r: position.r, c: position.c)]
    visited[position.r][position.c] = true
    let rP = [1, 0, -1, 0]
    let cP = [0, 1, 0, -1]

    while !queue.isEmpty {
        let visit = queue.removeFirst()
        let (r, c) = visit

        for i in 0 ..< 4 {
            let dr = r + rP[i]
            let dc = c + cP[i]
            
            if isColorBlindness {
                if color == "R" || color == "G" {
                    if dr >= 0, dc >= 0, n > dr, n > dc, !visited[dr][dc], (grid[dr][dc] == "R" || grid[dr][dc] == "G") {
                        queue.append((r: dr, c: dc))
                        visited[dr][dc] = true
                    } 
                }
                else {
                    if dr >= 0, dc >= 0, n > dr, n > dc, !visited[dr][dc], grid[dr][dc] == "B" {
                        queue.append((r: dr, c: dc))
                        visited[dr][dc] = true
                    }
                }
            }
            else {
                if dr >= 0, dc >= 0, n > dr, n > dc, !visited[dr][dc], grid[dr][dc] == color {
                    queue.append((r: dr, c: dc))
                    visited[dr][dc] = true
                }
            }
        }

    }
}


let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
let n = firstLine[0]

var grid = [[String]]()
for _ in 0 ..< n {
    if let row = readLine() {
        let rowArray = row.map { String($0) }
        if rowArray.count == n {
            grid.append(rowArray)
        } 
    }
}

let sol = colorArea(n: n, grid: grid)
print("\(sol.0) \(sol.1)")
