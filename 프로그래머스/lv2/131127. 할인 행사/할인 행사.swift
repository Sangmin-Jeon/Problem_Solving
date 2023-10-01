import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var hash = [String: Int]()
    var result: Int = 0
    want.enumerated().forEach({ idx, item in
        hash.updateValue(number[idx], forKey: item)
    })
    var tempHash = hash
    for i in 0 ... (discount.count - 10) {
        for day in i ..< (10 + i) {
            if var count = tempHash[discount[day]] {
                count -= 1
                tempHash.updateValue(count, forKey: discount[day])
            }
        }
        var didNotDist = false
        for (_, value) in tempHash {
            if value != 0 {
                didNotDist = true
                break
            }
        }
        if !didNotDist {
            result += 1
        }
        
        tempHash = hash
    }
    return result
}