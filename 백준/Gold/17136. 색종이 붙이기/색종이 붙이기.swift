
import Foundation

var paper = [Int](repeating: 5, count: 5)
var result = 100
var graph = [[Int]]()

func canAttach(r: Int, c: Int, n: Int) -> Bool {
    for _r in r ... r + n {
        for _c in c ... c + n {
            if graph[_r][_c] == 0 {
                return false
            }
        }
    }
    return true
}

func checkPaper() -> Bool {
    for r in 0 ..< 10 {
        for c in 0 ..< 10 {
            if graph[r][c] == 1 {
                return false
            }
        }
    }
    return true
}

func fillPaper(r: Int, c: Int, n: Int, f: Int) {
    for _r in r ... r + n {
        for _c in c ... c + n {
            graph[_r][_c] = f
        }
    }
}

func attachPaper(pCnt: Int) {
    if result < pCnt {
        return
    }
    
    if checkPaper() {
        if result > pCnt {
            result = pCnt
            return
        }
    }

    for r in 0 ..< 10 {
        for c in 0 ..< 10 {
            if graph[r][c] == 1 {
                for n in (0...4).reversed() {
                    if r >= 10, c >= 10 {
                        return
                    }
                    if paper[n] > 0, r + n < 10, c + n < 10, canAttach(r: r, c: c, n: n) {
                        paper[n] -= 1
                        fillPaper(r: r, c: c, n: n, f: 0)
                        attachPaper(pCnt: pCnt + 1)
                        paper[n] += 1
                        fillPaper(r: r, c: c, n: n, f: 1)
                    }
                }
                return
            }
        }
    }
}

// input
for _ in 0 ..< 10 {
    let row = readLine()!.split(separator: " ").map({ Int($0)! })
    graph.append(row)
}

attachPaper(pCnt: 0)
print(result == 100 ? -1 : result)

