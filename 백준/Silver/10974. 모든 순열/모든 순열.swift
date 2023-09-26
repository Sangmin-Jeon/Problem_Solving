import Foundation

func permutation(n: Int) -> [[Int]] {
    var visited = Array(repeating: false, count: n)
    var list = [Int]()
    var result = [[Int]]()
    dfs(n: n, visited: &visited, list: &list, result: &result)
    return result
}

func dfs(n: Int, visited: inout [Bool], list: inout [Int], result: inout [[Int]]) {
    if list.count == visited.count {
        result.append(list)
        return
    }
    
    for i in 0..<n {
        if !visited[i] {
            visited[i] = true
            list.append(i + 1)
            dfs(n: n, visited: &visited, list: &list, result: &result)
            visited[i] = false
            list.removeLast()
        }
    }
}

if let input = readLine(), let n = Int(input) {
    let sol = permutation(n: n)
    for perm in sol {
        print(perm.map { String($0) }.joined(separator: " "))
    }
} else {
    print("Invalid input")
}
