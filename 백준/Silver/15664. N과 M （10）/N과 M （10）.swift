import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
let nums = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var visited = Array(repeating: false, count: n)
var temp = [Int]()

func dfs(_ start: Int) {
    if temp.count == m {
        print(temp.map { String($0) }.joined(separator: " "))
        return
    }
    
    var rememberMe = 0
    for i in start..<n {
        if !visited[i] && rememberMe != nums[i] {
            visited[i] = true
            temp.append(nums[i])
            rememberMe = nums[i]
            dfs(i + 1)
            visited[i] = false
            temp.removeLast()
        }
    }
}

dfs(0)