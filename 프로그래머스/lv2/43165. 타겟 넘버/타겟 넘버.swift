import Foundation

var cnt = 0
func solution(_ numbers:[Int], _ target:Int) -> Int {
    dfs(numbers, target, 0, 0)
    
}

func dfs(_ numbers:[Int], _ target:Int, _ index: Int, _ sum: Int) -> Int {
    if index == numbers.count {
        if sum == target {
            cnt += 1
        }
        return 0
    }

    let left = dfs(numbers, target, index+1, sum + numbers[index])
    let right = dfs(numbers, target, index+1, sum - numbers[index])
    
    return cnt
}