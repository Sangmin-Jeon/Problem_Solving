import Foundation

let FSGUD = ["F", "S", "G", "U", "D"]
var type = [String: Int]()
let _ = readLine()!.split(separator: " ").enumerated().map({
    type[FSGUD[$0]] = Int($1)!
})

let answer = bfs()
print(answer)

func bfs() -> String {
    var visited = Array(repeating: false, count: type["F"]! + 1)

    var queue = [(Int, Int)]()
    queue.append((type["S"]!, 0))

    while !queue.isEmpty {
        let visit = queue.removeFirst()

        if visit.0 == type["G"]! {
            return String(visit.1)
        }

        let upperFloor = visit.0 + type["U"]!
        if upperFloor > 0, upperFloor <= type["F"]!, !visited[upperFloor] {
            queue.append((upperFloor, visit.1 + 1))
            visited[upperFloor] = true
        }
        let downFloor = visit.0 - type["D"]!
        if downFloor > 0, downFloor <= type["F"]!, !visited[downFloor] {
            queue.append((downFloor, visit.1 + 1))
            visited[downFloor] = true
        }

    }

    return String("use the stairs")

}