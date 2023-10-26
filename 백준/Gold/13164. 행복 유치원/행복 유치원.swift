import Foundation

let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
let n = input[0]
let k = input[1]
var children = readLine()!.split(separator: " ").compactMap({ Int($0) })

var gapList = [Int]()
for i in 0 ..< (children.count - 1) {
    gapList.append(children[i + 1] - children[i])
}
gapList.sort(by: <)
let answer = gapList[0 ..< n-k].reduce(0, +)
print(answer)