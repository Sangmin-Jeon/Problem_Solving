import Foundation

if let input = readLine(), let t = Int(input) {
    for _ in 0 ..< t {
        let store_cnt = Int(readLine()!)!
        let cur_roc = readLine()!.split(separator: " ").map({ Int($0)! })
        var store_roc = [(Int, Int)]()
        for _ in 0 ..< store_cnt {
            let row = readLine()!.split(separator: " ").map({ Int($0)! })
            store_roc.append((row.first!, row.last!))
        }
        let festival_roc = readLine()!.split(separator: " ").map({ Int($0)! })
        let answer = goToFestival(store_cnt, cur_roc, store_roc, festival_roc)
        print(answer)
    }
}

func goToFestival(_ store_cnt: Int, 
                  _ cur_roc: [Int], 
                  _ store_roc: [(Int, Int)], 
                  _ festival_roc: [Int]) -> String {
    let gaol_roc = (festival_roc.first!, festival_roc.last!)

    var queue = [(Int, Int)]()
    queue.append((cur_roc.first!, cur_roc.last!))

    var visited = Array(repeating: false, count: store_roc.count)

    while !queue.isEmpty {
        let cur_roc = queue.removeFirst()

        let goal_dist = abs(gaol_roc.0 - cur_roc.0) + abs(gaol_roc.1 - cur_roc.1)
        if goal_dist <= 1000 {
            return String("happy")
        }

        for idx in 0 ..< store_roc.count {
            if !visited[idx] {
                let dist = abs(store_roc[idx].0 - cur_roc.0) + abs(store_roc[idx].1 - cur_roc.1)
                if dist <= 1000 {
                    queue.append((store_roc[idx].0, store_roc[idx].1))
                    visited[idx] = true
                }
            }
        }

    }

    return String("sad")
    
}