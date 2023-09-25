import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var times = [(st: Int, et: Int)]()
    book_time.forEach({ _times in
        times.append((_times.first!.setTime(type: "st"), _times.last!.setTime(type: "et")))
    })
    times.sort(by: { $0.st < $1.st })
    
    var rooms = [(st: Int, et: Int)]()

    loop: for time in times {
        for (idx, room) in rooms.enumerated() {
            if !(room.0 ..< room.1 ~= time.0) {
                rooms[idx] = time
                continue loop
            }
        }

        rooms.append((st: time.st, et: time.et))
    }

    
    return rooms.count
}


extension String {
    func setTime(type: String) -> Int {
        let components = self.split(separator: ":")
        let hour = Int(components[0])!
        let minute = Int(components[1])!
        return type == "et" ? (hour * 60 + minute + 10) : (hour * 60 + minute)
    }
    
}
