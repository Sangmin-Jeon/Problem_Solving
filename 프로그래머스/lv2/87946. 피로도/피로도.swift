import Foundation

var list = [[Int]]()
func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: dungeons.count)
    return enterDungeon(k: k, dungeons: dungeons, visited: &visited, depth: 0)
}

func enterDungeon(k: Int, dungeons:[[Int]], visited: inout [Bool], depth: Int) -> Int {
    var result = depth
    
    for (index, dungeon) in dungeons.enumerated() {
        if !visited[index], k >= dungeon.first! {
            visited[index] = true
            list.append(dungeon)
            let _depth = enterDungeon(
                k: k - dungeon.last!,
                dungeons: dungeons,
                visited: &visited,
                depth: depth + 1
            )
            list.removeLast()
            visited[index] = false
            
            result =  max(result, _depth)
        }
    }
    
    return result
}