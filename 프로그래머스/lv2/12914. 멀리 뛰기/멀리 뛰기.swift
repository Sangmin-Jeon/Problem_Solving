var memo = [Int: Int]()

func solution(_ n:Int) -> Int {
    if n < 2 {
        return 1
    }
    
    if let memo = memo[n] {
        return memo
    }
    
    let oneStep = solution(n - 1) % 1234567
    let twoStep = solution(n - 2) % 1234567
    
    memo[n] = (oneStep + twoStep) % 1234567
    return (oneStep + twoStep)  % 1234567
}