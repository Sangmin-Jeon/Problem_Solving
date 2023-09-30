import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var answer = 0
    var rooms = Array(repeating: 0, count: 1450) // 1450 = 24 * 60 + 10
    
    for time in book_time {
        let inTime = time[0]
        let outTime = time[1]
        
        rooms[inTime.cT()] += 1
        rooms[outTime.cT() + 10] -= 1 // 퇴실 시간 +10
    }
    
    // 구간합
    for i in 1 ..< 1450 {
        rooms[i] += rooms[i - 1]
        answer = max(answer, rooms[i])
    }
    
    return answer
}

extension String {
    func cT() -> Int {
        let times = self.map({ String($0) })
        let hour = Int(times[0] + times[1])! * 60
        let min = Int(times[3] + times[4])!
        return hour + min
    }
}