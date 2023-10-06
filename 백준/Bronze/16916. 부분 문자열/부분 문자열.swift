import Foundation

func searchSubString(p: String, s: String) -> Int {
    return KMP(parent: p, pattern: s) > 0 ? 1 : 0
}

func makeTable(pattern: String) -> [Int] {
    let patternArr = Array(pattern)
    let patternSize = patternArr.count
    var table = Array(repeating: 0, count: patternSize)
    var j = 0

    for i in 1..<patternSize {
        while j > 0, patternArr[i] != patternArr[j] {
            j = table[j - 1]
        }
        if patternArr[i] == patternArr[j] {
            j += 1
            table[i] = j
        }
    }
    return table
}

func KMP(parent: String, pattern: String) -> Int {
    let parentArr = Array(parent)
    let patternArr = Array(pattern)
    let parentSize = parentArr.count
    let patternSize = patternArr.count
    var j = 0

    let table = makeTable(pattern: pattern)

    var matches = 0

    for i in 0 ..< parentSize {
        while j > 0, parentArr[i] != patternArr[j] {
            j = table[j - 1]
        }
        if parentArr[i] == patternArr[j] {
            if j == patternSize - 1 {
                // 매칭 된 부분 찾은 경우
                matches += 1
                j = table[j]
            } else {
                j += 1
            }
        }
    }

    return matches
}


let p = String(readLine()!)
let s = String(readLine()!)

print(searchSubString(p: p, s: s))