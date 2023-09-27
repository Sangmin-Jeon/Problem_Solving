import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var sizeList = [Int: Int]()
    for _tangerine in tangerine {
        let getTangCnt = sizeList[_tangerine]
        let tangCnt = getTangCnt == nil ? 1 : getTangCnt! + 1
        sizeList.updateValue(tangCnt, forKey: _tangerine)
    }
    
    let sortedList = sizeList.sorted(by: { $0.value > $1.value })
    var k = k
    var cnt = 0

    for _tangerine in sortedList {
        if (k - _tangerine.value) <= 0 {
            cnt += 1
            break
        }
        
        cnt += 1
        k -= _tangerine.value
        
    }
    
    return cnt
}
