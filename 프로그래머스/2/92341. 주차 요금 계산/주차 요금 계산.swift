import Foundation

let endTime = (23 * 60) + 59

func setRecords(_ records: [String], _ carsInfo: inout [String: Int]) {
    var timeTable = [String: Int]()
    for record in records {
        let info = record.split(separator: " ").map({ String($0) })
        let time = info[0].split(separator: ":").map({ String($0) })

        if info[2] == "IN" {
            timeTable[info[1], default: 0] = (Int(time.first!)! * 60) + Int(time.last!)!
        }
        else if info[2] == "OUT" {
            let newTime = (Int(time.first!)! * 60) + Int(time.last!)! - timeTable[info[1]]!
            timeTable[info[1]] = -1
            carsInfo[info[1], default: 0] += newTime
            
        }
    }

    for (car, time) in timeTable {
        if time != -1 {
           carsInfo[car, default: 0] += (endTime - time)
        }
    }

}

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var answer = [Int]()
    let defTime = fees[0]
    let defFee = fees[1]
    let unitTime = fees[2]
    let unitFee = fees[3]

    var carsInfo = [String: Int]()
    setRecords(records, &carsInfo)

    let timeInfo = carsInfo.sorted(by: { $0.key < $1.key })
    for (_, time) in timeInfo {
        if defTime >= time {
            answer.append(defFee)
            continue
        }
        let calTime = ceil((Double(time) - Double(defTime)) / Double(unitTime))
        answer.append(defFee + (Int(calTime) * unitFee))
    }
    
    return answer
}

