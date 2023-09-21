import Foundation

var cnt = 0
func solution(_ numbers:[Int], _ target:Int) -> Int {
    dfs(numbers, target, 0, 0, [])
    
}

func dfs(_ numbers:[Int], _ target:Int, _ number: Int, _ index: Int, _ sum: [Int]) -> Int {
    var sum = sum
    sum.append(number)
    if index == numbers.count {
        if sum.reduce(0, +) == target {
            cnt += 1
        }
        return 0
    }
    let left = dfs(numbers, target, numbers[index], index+1, sum)
    let right = dfs(numbers, target, -numbers[index], index+1, sum)
    
    return cnt
}