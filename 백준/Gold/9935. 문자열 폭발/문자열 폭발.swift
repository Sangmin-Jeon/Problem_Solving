import Foundation

let str = readLine()!
let target = readLine()!
let length = target.count
var stack: [Character] = []

for s in str {
    stack.append(s)
    if s == target.last && stack.count >= length {
        if String(stack[stack.count - length ..< stack.count]) == target {
            stack.removeLast(length)
        }
    }
}

print(stack.isEmpty ? "FRULA" : String(stack))