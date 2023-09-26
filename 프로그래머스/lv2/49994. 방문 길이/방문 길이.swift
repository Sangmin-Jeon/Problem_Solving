import Foundation

struct Rocation: Hashable {
    let row: Int
    let col: Int
}


func solution(_ dirs:String) -> Int {
    if dirs.isEmpty {
        return 0
    }
    var visited = Set<[Rocation]>()
    var cur_Point = Rocation(row: 0, col: 0)
    
    for dir in dirs {
        let command = dir
        var _row = cur_Point.row
        var _col = cur_Point.col
        
        switch command {
        case "U":
            _row += 1
        case "D":
            _row -= 1
        case "R":
            _col += 1
        case "L":
            _col -= 1
        default:
            break
        }
        
        if _row < -5 || _row > 5 || _col < -5 || _col > 5 {
            continue
        }
        
        let next_Point = Rocation(row: _row, col: _col)
        
        let root1 = [cur_Point]
        let root2 = [next_Point]

        if !visited.contains(root1 + root2), !visited.contains(root2 + root1) {
            visited.insert(root1 + root2)
        }
        cur_Point = next_Point
        
    }

    return visited.count
}
