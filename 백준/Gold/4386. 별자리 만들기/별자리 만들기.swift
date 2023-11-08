import Foundation

let starCnt = Int(readLine()!)!
var stars = [(Int, Double, Double)]()
var parent = Array(0..<starCnt)

for i in 0..<starCnt {
    let coordinates = readLine()!.split(separator: " ").map { Double(String($0))! }
    stars.append((i, coordinates[0], coordinates[1]))
}

var edges = [(Int, Int, Double)]()

for i in 0 ..< starCnt {
    for j in 0 ..< starCnt {
        if i == j {
            continue
        }
        let distance = sqrt(pow(stars[i].1 - stars[j].1, 2) + pow(stars[i].2 - stars[j].2, 2))
        edges.append((i, j, distance))
    }
}

edges.sort(by: { $0.2 < $1.2 })

func union(_ x: Int, _ y: Int) {
    let rootX = find(x)
    let rootY = find(y)
    parent[rootY] = rootX
}

func find(_ x: Int) -> Int {
    if parent[x] == x {
        return parent[x]
    }
    parent[x] = find(parent[x])
    return parent[x]
}

var answer = 0.0

for edge in edges {
    if find(edge.0) == find(edge.1) {
        continue
    }
    answer += edge.2
    union(edge.0, edge.1)
}

let sol = round(answer * 100) / 100
print(sol)
