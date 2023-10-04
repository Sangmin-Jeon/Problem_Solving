func dfs(t: [String]) {
    if t == s {
        result = true
        return
    }

    if t.isEmpty {
        return
    }

    if let last = t.last, last == "A" {
        var aT = t
        aT.removeLast()
        dfs(t: aT)
    }

    if let first = t.first, first == "B" {
        var bT = t
        bT.removeFirst()
        bT = bT.reversed()
        dfs(t: bT)
    }
    
}

let s = readLine()!.map({ String($0) })
var t = readLine()!.map({ String($0) })
var result = false

dfs(t: t)

print(result ? 1 : 0)