import Foundation

let n = Int(readLine()!)!
var memo = [Int: Int]()

print(dfs(n: n))

func dfs(n: Int) -> Int {
    if n == 0 {
        return 0
    }

    if n < 0 {
        return -1
    }

    if let result = memo[n] {
        return result
    }

    let using5Kg = dfs(n: n - 5)
    let using3Kg = dfs(n: n - 3)

    if using5Kg == -1 && using3Kg == -1 {
        memo[n] = -1
    } 
    else if using5Kg == -1 {
        memo[n] = using3Kg + 1
    } 
    else if using3Kg == -1 {
        memo[n] = using5Kg + 1
    } 
    else {
        memo[n] = min(using5Kg, using3Kg) + 1
    }

    return memo[n]!
}
