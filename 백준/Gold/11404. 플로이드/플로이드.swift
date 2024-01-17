import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var busInfo = [Int: [(Int, Int)]]()
for _ in 0 ..< m {
    let row = readLine()!.split(separator: " ").map({ Int($0)! })
    if var routes = busInfo[row[0] - 1] {
        if let index = routes.firstIndex(where: { $0.0 == row[1] - 1 }) {
            routes[index].1 = min(row[2], routes[index].1)
        } 
        else {
            routes.append((row[1] - 1, row[2]))
        }
        busInfo[row[0] - 1] = routes
    } 
    else {
        busInfo[row[0] - 1] = [(row[1] - 1, row[2])]
    }
}

func floydWarshall() -> [[Int]] {
    let INF = Int.max / 2
    var dist = [[Int]](repeating: [Int](repeating: INF, count: n), count: n)

    for i in 0 ..< n {
        dist[i][i] = 0
    }

    for (start, destinations) in busInfo {
        for (end, cost) in destinations {
            dist[start][end] = cost
        }
    }

    for k in 0 ..< n {
        for i in 0 ..< n {
            for j in 0 ..< n {
                if dist[i][k] + dist[k][j] < dist[i][j] {
                    dist[i][j] = dist[i][k] + dist[k][j]
                }
            }
        }
    }

    return dist
}

let result = floydWarshall()
for i in 0 ..< n {
    var row = ""
    for j in 0 ..< n {
        row += (result[i][j] == Int.max / 2 ? "0" : String(result[i][j])) + " "
    }
    print(row)
}