import Foundation
var totalZero = 0
var totalOne = 0

func solution(_ arr:[[Int]]) -> [Int] {
    dfs(arr: arr, row: 0, col: 0, size: arr.count)
    return [totalZero, totalOne]
}

func dfs(arr:[[Int]], row: Int, col: Int, size: Int)  { // z, o
    if size < 1 {
        return
    }

    var zeroCnt = 0
    var oneCnt = 0

    for i in row ..< row + size {
        for j in col ..< col + size {
            if arr[i][j] == 1 {
                oneCnt += 1
            }
            else {
                zeroCnt += 1
            }
        }
    }
    if zeroCnt == (size * size) {
        totalZero += 1 
        return
    }
    if oneCnt == (size * size) {
        totalOne += 1
        return
    }
    
    let halfSize = (size / 2)

    dfs(arr: arr, row: row, col: col, size: halfSize)
    dfs(arr: arr, row: row, col: (halfSize + col), size: halfSize)
    dfs(arr: arr, row: (halfSize + row), col: col, size: halfSize)
    dfs(arr: arr, row: (halfSize + row), col: (halfSize + col), size: halfSize)
 
}
