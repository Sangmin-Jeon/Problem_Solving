var dwarfs = [Int]()

for _ in 0 ..< 9 {
    dwarfs.append(Int(readLine()!)!)
}

var list = [Int]()
var visited = Array(repeating: false, count: 9)

var result = [Int]()

dfs(list: &list)

for dwarf in result {
    print(dwarf)
}

func dfs(list: inout [Int]) {
    if list.count > 7 {
        return
    }
    if list.count == 7, list.reduce(0, +) == 100 {
        result = list.sorted(by: <)
        return 
    }

    for (index, dwarf) in dwarfs.enumerated() {
        if result.isEmpty, !visited[index] {
            visited[index] = true
            list.append(dwarf)
            dfs(list: &list)
            list.removeLast()
            visited[index] = false
        }
    }
}