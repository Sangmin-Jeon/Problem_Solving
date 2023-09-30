import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var times = [(st: Int, et: Int)]()
    for _time in book_time {
        times.append((st: _time[0].cT(), et: _time[1].cT() + 10))
    }
    var rooms = [(st: Int, et: Int)]()
    times.sort(by: { $0.st < $1.st })
    
loop: for time in times {
        for (idx, room) in rooms.enumerated() {
            if !(room.st ..< room.et ~= time.st) {
                rooms[idx] = time
                continue loop
            }
        }
        
        rooms.append((st: time.st ,et: time.et))
    }

    return rooms.count
}

extension String {
    func cT() -> Int {
        let times = self.map({ String($0) })
        let hour = Int(times[0] + times[1])! * 60
        let min = Int(times[3] + times[4])!
        return hour + min
    }
}
