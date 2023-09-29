var whiteCnt = 0
var blueCnt = 0
func makeColorPaper(colorPaper: [[Int]], n: Int) -> (white: Int, blue: Int) {
    dfs(colorPaper: colorPaper, row: 0, col: 0, n: n)
    return (whiteCnt, blueCnt)
}

func dfs(colorPaper: [[Int]], row: Int, col: Int, n: Int)  {
    if n < 1 {
        return
    }
    
    var wt = 0
    var bu = 0
    
    for i in row ..< row + n {
        for j in col ..< col + n {
            if colorPaper[i][j] == 0 {
                wt += 1
            }
            else {
                bu += 1
            }
        }
    }
    
    if wt == n * n {
        whiteCnt += 1
        return
    }
    
    if bu == n * n {
        blueCnt += 1
        return
    }
    
    let halfSize = (n / 2)
    
    dfs(colorPaper: colorPaper, row: row, col: col, n: halfSize)
    dfs(colorPaper: colorPaper, row: row, col: col + halfSize, n: halfSize)
    dfs(colorPaper: colorPaper, row: row + halfSize, col: col, n: halfSize)
    dfs(colorPaper: colorPaper, row: row + halfSize, col: col + halfSize, n: halfSize)
    
}

// MARK: 입력
let dimensions = readLine()!.split(separator: " ").map { Int($0)! }
let n = dimensions[0]

var colorPaper = [[Int]]()

for _ in 0 ..< n {
    if let row = readLine() {
        let rowArray = row.split(separator: " ").map { Int($0) ?? 0 }
        if rowArray.count == n {
            colorPaper.append(rowArray)
        }
        
    }
}

let sol = makeColorPaper(colorPaper: colorPaper, n: n)
print(sol.white)
print(sol.blue)