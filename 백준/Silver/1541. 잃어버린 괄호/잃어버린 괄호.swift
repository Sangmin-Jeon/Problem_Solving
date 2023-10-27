import Foundation

let input = String(readLine()!)
let arr = input.split(separator: "-")

var list = [Int]()
arr.forEach({ str in
    let temp = str.split(separator: "+").map({ Int($0)! })
    list.append(temp.reduce(0, +))
})

var answer = list.removeFirst()
list.forEach({ num in
    answer -= num
})  

print(answer)