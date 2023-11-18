import Foundation

func largestRectangleArea(_ heights: [Int]) -> Int {
    var maxArea = 0
    var stack = [Int]()
    var heights = heights + [0]

    for i in 0..<heights.count {
        while !stack.isEmpty && heights[i] < heights[stack.last!] {
            let height = heights[stack.removeLast()]
            let width = stack.isEmpty ? i : i - stack.last! - 1
            maxArea = max(maxArea, height * width)
        }
        stack.append(i)
    }

    return maxArea
}

while let line = readLine() {
    let values = line.split(separator: " ").map { Int($0)! }
    if values[0] == 0 { break }
    let heights = Array(values[1...])
    print(largestRectangleArea(heights))
}