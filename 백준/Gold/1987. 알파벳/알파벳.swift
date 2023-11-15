import Foundation

let input = readLine()!.split(separator: " ").map({ Int($0)! })
let row = input[0]
let column = input[1]
var graph = [[Int]]()
for _ in 0 ..< row {
    let _row = readLine()!.map({ Int($0.asciiValue!) - 65 })
    graph.append(_row)
}

var answer = 0
let dr = [1, 0, -1, 0]
let dc = [0, 1, 0, -1]

let mask = 1 << graph[0][0]
dfs(mask, (r: 0, c: 0), 1)
print(answer)

func dfs(_ alphaMask: Int,
         _ dist: (r: Int, c: Int),
         _ depth: Int) {

    answer = max(answer, depth)

    for i in 0 ..< 4 {
        let r = dist.r + dr[i]
        let c = dist.c + dc[i]
        
        if r >= 0, c >= 0, row > r, column > c {
            let ascii = 1 << graph[r][c]
            if alphaMask & ascii == 0 {
                dfs(alphaMask | ascii, (r: r, c: c), depth + 1)
                
            }
        }
    }

}
