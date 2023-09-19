import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var computers = computers
    var table = setTable(computers: &computers)
    var visited = [Int: Bool]()
    var cnt = 0
    table.forEach { key, value in
        if visited[key] == nil {
            bfs(table: table, key: key, visited: &visited)
            cnt += 1
        }
    }
    
    return cnt
}

func setTable(computers: inout [[Int]]) -> [Int: [Int]] {
    var table = [Int: [Int]]()
    
    for i in 0 ..< computers.count {
        for j in 0 ..< computers[i].count {
            if computers[i][j] == 1 {
                if var link = table[i] {
                    link.append(j)
                    table.updateValue(link, forKey: i)
                }
                else {
                    table.updateValue([j], forKey: i)
                }
            }
            else if i == j {
                table.updateValue([], forKey: i)
            }
        }
    }
    
    return table
}

func bfs(table: [Int:  [Int]], key: Int, visited: inout [Int: Bool]) {
    var queue = [Int]()
    
    queue.append(key)
    while !queue.isEmpty {
        let visit = queue.removeFirst()
        visited.updateValue(true, forKey: visit)
        
        table[visit]?.forEach({ num in
            if visited[num] == nil {
                queue.append(num)
            }
        })
    }
}

