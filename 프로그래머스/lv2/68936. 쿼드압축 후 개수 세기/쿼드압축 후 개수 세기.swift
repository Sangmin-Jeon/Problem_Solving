import Foundation

var totalZero = 0
var totalOne = 0

func solution(_ arr: [[Int]]) -> [Int] {
    dfs(arr: arr, n: arr.count, r: 0, c: 0)
    return [totalZero, totalOne]
}

func dfs(arr: [[Int]], n: Int, r: Int, c: Int) {
    if n < 1 {
        return
    }
    
    var one = 0
    var zero = 0
    
    for i in r ..< r + n {
        for j in c ..< c + n {
            if arr[i][j] == 1 {
                one += 1
            }
            else {
                zero += 1
            }
        }
    }
    
    if one == (n * n) {
        totalOne += 1
        return
    }
    
    if zero == (n * n) {
        totalZero += 1
        return
    }
    
    let halfSize = n / 2
    
    dfs(arr: arr, n: halfSize, r: r, c: c)
    dfs(arr: arr, n: halfSize, r: r, c: (halfSize + c))
    dfs(arr: arr, n: halfSize, r: (halfSize + r), c: c)
    dfs(arr: arr, n: halfSize, r: (halfSize + r), c: (halfSize + c))
    
}