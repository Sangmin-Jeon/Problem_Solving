import Foundation

let topBottom = [0: 5, 5: 0, 1: 3, 3: 1, 2: 4, 4: 2]
var diceInfo = [[Int]]()
// 주사위의 개수 입력
if let diceCountInput = readLine(), let diceCount = Int(diceCountInput) {
    // 주사위의 개수만큼 입력 받음
    for _ in 0 ..< diceCount {
        diceInfo.append(readLine()!.split(separator: " ").compactMap { Int($0) })
    }
    
    var fin_result = 0
    for i in 0 ..< diceInfo.first!.count {
        let topIdx = i
        let bottomIdx = topBottom[topIdx]!
        var m = 0
        for j in 0 ..< diceInfo.first!.count {
            if topIdx != j, bottomIdx != j {
                m = max(m, diceInfo.first![j])
            }
        } 

        let result = stackDice(prevTop: diceInfo.first![topIdx], n: 1, sum: m)
        fin_result = max(fin_result, result)
    }
    print(fin_result)

    func stackDice(prevTop: Int, n: Int, sum: Int) -> Int {
        if n == diceCount {
            return sum
        }
        
        guard let bottomIdx = diceInfo[n].firstIndex(of: prevTop) else { return 0 }
        let topIdx = topBottom[bottomIdx]!

        var m = 0
        for i in 0 ..< diceInfo[n].count {
            if topIdx != i, bottomIdx != i {
                m = max(m, diceInfo[n][i])
            }
        }
        var sum = sum
        sum += m

        return stackDice(prevTop: diceInfo[n][topIdx], n: n + 1, sum: sum)
        
    }
    
}
