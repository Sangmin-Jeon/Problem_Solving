import Foundation
 
let input = readLine()!.split(separator: " ").map({ Int($0)! })
let n = input.first ?? 0
let k = input.last ?? 0

var visited = Array(repeating: false, count: 100001)
var queue = [(Int, Int)]()
queue.append((n, 0))
var answer = (n, 0)

while answer.0 != k {
    let visit = queue.removeFirst()
    let (n, d) = visit
    
    answer = (n, d)

    if answer.0 == k {
        break
    }

    if n + 1 <= 100000, n + 1 >= 0, !visited[n + 1] {
        queue.append((n + 1, d + 1))
        visited[n + 1] = true
    }
    if n - 1 <= 100000,n - 1 >= 0, !visited[n - 1] {
        queue.append((n - 1, d + 1))
        visited[n - 1] = true
    }
    if 2 * n <= 100000,2 * n >= 0, !visited[2 * n] {
        queue.append((2 * n, d + 1))
        visited[2 * n] = true
    }

}

print(answer.1)
