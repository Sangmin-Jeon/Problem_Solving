import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var dp = Array(repeating: Int.max, count: y + 1)
    dp[x] = 0

    for i in x...y {
        if dp[i] == Int.max {
            continue
        }
        if i + n <= y {
            dp[i + n] = min(dp[i + n], dp[i] + 1)
        }
        if i * 2 <= y {
            dp[i * 2] = min(dp[i * 2], dp[i] + 1)
        }
        if i * 3 <= y {
            dp[i * 3] = min(dp[i * 3], dp[i] + 1)
        }
    }

    return dp[y] == Int.max ? -1 : dp[y]
}