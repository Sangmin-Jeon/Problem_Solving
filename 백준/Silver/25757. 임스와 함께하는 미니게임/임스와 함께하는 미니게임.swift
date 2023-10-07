import Foundation

let miniGames = ["Y": 1, "F": 2, "O": 3]

let input1 = readLine()!.split(separator: " ")
let N = Int(input1[0])! 
let type = String(input1[1]) 

var names = [String]()
for _ in 0 ..< N {
    if let name = readLine() {
        names.append(name)
    }
}

let users = Set(names)
let result = (users.count / miniGames[type]!)
print(result)