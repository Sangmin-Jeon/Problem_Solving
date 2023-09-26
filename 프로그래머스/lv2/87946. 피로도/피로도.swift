import Foundation

var glbl_dungeons = [[Int]]()
var glbl_visited = [Bool]()

func solution(_ k: Int, _ dungeons: [[Int]]) -> Int {
    var result = [Int]()
    glbl_dungeons = dungeons
    glbl_visited = Array(repeating: false, count: dungeons.count)
    return dfs(k: k, dungeons: [[]], depth: 0, result: &result)
}

func dfs(k: Int, dungeons: [[Int]], depth: Int, result: inout [Int]) -> Int {
    var maxDepth = depth
    
    for (idx, dungeon) in glbl_dungeons.enumerated() {
        if !glbl_visited[idx], dungeon.first! <= k {
            glbl_visited[idx] = true
            let _depth = dfs(
                k: k - dungeon.last!,
                dungeons: dungeons + [dungeon],
                depth: depth + 1,
                result: &result
            )
            maxDepth = max(maxDepth, _depth)
            glbl_visited[idx] = false
        }
    }
    
    return maxDepth
}