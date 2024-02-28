import Foundation

func solution(_ queue:[Int], _ queue2:[Int]) -> Int {
    var sum = queue.reduce(0, +) 
    var sum2 = queue2.reduce(0, +) 
    var totalSum = sum + sum2
    var answer = 0
    var left = 0
    var right = queue.count
    var array = queue + queue2
    var target = (totalSum / 2)
    
    if (totalSum % 2 != 0) || (target < queue.max()! || target < queue2.max()!) {
        return -1
    }
    
    while right < array.count, left <= right {
        if sum < target {
            sum += array[right] 
            right += 1
        } 
        else if sum > target {
            sum -= array[left]
            left += 1 
        } 
        else {
            return answer
        }
        answer += 1
    }

    return -1
}