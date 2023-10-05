import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let total = brown + yellow
    var totalList = [(r: Int, c: Int)]()
    for i in 1...total {
        if total % i == 0 {
            let j = total / i
            if i >= j {
                totalList.append((r: i, c: j))
            }
        }
    }
    
    var yellowList = [(r: Int, c: Int)]()
    for i in 1...yellow {
        if yellow % i == 0 {
            let j = yellow / i
            yellowList.append((r: i, c: j))
        }
    }
    
    var answer = [(r: Int, c: Int)]()
    for i in 0 ..< yellowList.count {
        for j in 0 ..< totalList.count {
            if (totalList[j].r - yellowList[i].r >= 2), (totalList[j].c - yellowList[i].c >= 2) {
                answer.append((r: totalList[j].r, c: totalList[j].c))
            }
        }
    }
    return [answer.last!.r, answer.last!.c]

}