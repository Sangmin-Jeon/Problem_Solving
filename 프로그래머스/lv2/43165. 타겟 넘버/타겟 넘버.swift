import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    let numCnt = numbers.count
    return dfs(numbers, target, 0, 0, numCnt)
}

func dfs(_ numbers:[Int], _ target:Int, _ index: Int, _ sum: Int, _ numCnt: Int) -> Int {
    if index == numCnt {
        if sum == target {
            return 1
        }
        return 0
    }

    let left = dfs(numbers, target, index + 1, sum + numbers[index], numCnt)
    let right = dfs(numbers, target, index + 1, sum - numbers[index], numCnt)
    
    return left + right
}