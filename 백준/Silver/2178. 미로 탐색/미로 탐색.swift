func escapeMaze(n: Int, m: Int, maze: [[Int]]) -> Int {
    graphBfs(maze: maze, n: (n - 1), m: (m - 1))
    
}

func graphBfs(maze: [[Int]], n: Int, m: Int) -> Int {
    var maze = maze
    var queue = [(r: Int, c: Int, l: Int)]()
    
    let dr = [-1, 0, 1, 0]
    let dc = [0, 1, 0, -1]
    
    queue.append((r: 0, c: 0, l: 1))
    maze[0][0] = 0
    
    while !queue.isEmpty {
        let visit = queue.removeFirst()
        let (r, c, l) = visit
        
        for i in 0 ..< 4 {
            let _dr = r + dr[i]
            let _dc = c + dc[i]
            
            if _dr >= 0, _dc >= 0,
               maze.count > _dr, maze.first!.count > _dc,
               maze[_dr][_dc] == 1 {
                if _dr == n, _dc == m {
                    return l + 1
                }
                
                queue.append((r: _dr, c: _dc, l: l + 1))
                maze[_dr][_dc] = 0
                
            }
        }
        
    }
    
    return 0
}


let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]

var maze = [[Int]]()

for _ in 0..<N {
    if let row = readLine() {
        let rowArray = row.map { Int(String($0))! }
        if rowArray.count == M {
            maze.append(rowArray)
        } 
    }
}


let sol = escapeMaze(n: N, m: M, maze: maze)
print(sol)