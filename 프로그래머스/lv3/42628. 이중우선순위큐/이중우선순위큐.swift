import Foundation

func solution(_ operations:[String]) -> [Int] {
    var queue = [Int]()
    for oper in operations {
        let getOper = oper.components(separatedBy: " ")
        switch getOper.first! {
        case "I": // 삽입
            queue.append(Int(getOper.last!)!)
        case "D": // 최대, 최소 삭제
            if getOper.last! == "1" {
                if let max = queue.max(),
                    let idx = queue.firstIndex(of: max) {
                    queue.remove(at: idx)
                }
            }
            else {
                if let min = queue.min(),
                   let idx = queue.firstIndex(of: min) {
                    queue.remove(at: idx)
                }
            }
        default:
            break
        }
    }
    
    return queue.isEmpty ? [0, 0] : [queue.max()!, queue.min()!]
}