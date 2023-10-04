let input = Int(readLine()!)!

let roop = input / 4
var result = [String]()
for i in 0 ..< roop {
    result.append("long ")
}
result.append("int")

print(result.reduce("", +))