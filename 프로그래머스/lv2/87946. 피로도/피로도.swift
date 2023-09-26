import Foundation

var _dungeons = [[Int]]()
var _visited = [Bool]()

func solution(_ k: Int, _ dungeons: [[Int]]) -> Int {
    _dungeons = dungeons
    _visited = Array(repeating: false, count: dungeons.count)
    return dfs(k: k, dungeons: [[]], l: 0)
}

func dfs(k: Int, dungeons: [[Int]], l: Int) -> Int {
    var maxCount = l // 최대 던전 탐험 수를 저장하는 변수
    
    for (idx, dungeon) in _dungeons.enumerated() {
        if !_visited[idx], dungeon.first! <= k { // "최소 필요 피로도"와 비교
            _visited[idx] = true
            let cnt = dfs(k: k - dungeon.last!, dungeons: dungeons + [dungeon], l: l + 1)
            maxCount = max(maxCount, cnt)
            _visited[idx] = false
        }
    }
    
    return maxCount
}