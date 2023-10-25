import Foundation

let n = Int(readLine()!) ?? 0
var meetings = [(Int, Int)]()

for _ in 0 ..< n {
    if let input = readLine() {
        let times = input.split(separator: " ").compactMap { Int($0) }
        if times.count == 2 {
            meetings.append((times[0], times[1]))
        }
    }
}

meetings.sort { (a: (Int,Int), b :(Int,Int)) -> Bool in
    if a.1 == b.1 {
        return a.0 < b.0
    } 
    else {
        return a.1 < b.1
    }
}

var meetCnt = 0
var currentTime = 0

for (inTime, outTime) in meetings {
    if inTime >= currentTime {
        meetCnt += 1
        currentTime = outTime
    }
}

print(meetCnt)