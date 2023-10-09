import Foundation

let n = Int(readLine()!)!
var rgbPrice = Array(repeating: [0, 0, 0], count: n)

for i in 0 ..< n {
    rgbPrice[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

var memo = Array(repeating: Array(repeating: 0, count: 3), count: n)

memo[0][0] = rgbPrice[0][0]
memo[0][1] = rgbPrice[0][1]
memo[0][2] = rgbPrice[0][2]

for i in 1 ..< n {
    memo[i][0] = min(memo[i - 1][1], memo[i - 1][2]) + rgbPrice[i][0] 
    memo[i][1] = min(memo[i - 1][0], memo[i - 1][2]) + rgbPrice[i][1] 
    memo[i][2] = min(memo[i - 1][0], memo[i - 1][1]) + rgbPrice[i][2]

}
var answer = Int.max
for i in 0 ..< 3 {
    answer = min(answer, memo.last![i])
}
print(answer)