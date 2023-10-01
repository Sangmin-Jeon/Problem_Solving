import Foundation

var visited = [String: [Bool]]()
var result = [[String]]()
func solution(_ tickets:[[String]]) -> [String] {
    var hash = [String: [String]]()
    for ticket in tickets {
        if var value = hash[ticket.first!] {
            value.append(ticket.last!)
            hash.updateValue(value, forKey: ticket.first!)
            continue
        }
        hash.updateValue([ticket.last!], forKey: ticket.first!)
        
    }
    // 공항 우선순위 정렬
    for (key, value) in hash {
        var value = value
        value.sort()
        hash.updateValue(value, forKey: key)
    }
    // combination쓰기 위해 visited배열 생성
    for (key, value) in hash {
        let arr = Array(repeating: false, count: value.count)
        visited.updateValue(arr, forKey: key)
    }
    var history = [String]()
    history.append("ICN") // 시작은 항상 ICN
    combination(hash: hash, history: history, n: (tickets.count + 1))
    return result.first!
}

func combination(hash: [String: [String]], history: [String], n: Int) {
    var history = history
    guard let key = history.last else { return } // 현재 방문
    let tickets = hash[key] // 방문 할 공항
    
    if !result.isEmpty {
        // 경로가 하나라도 완성되면 종료
        return
    }
    
    // 처음 입력받은 tickets배열의 크기 +1이 티켓을 모두 사용한 경로가 됨
    if history.count == n, !result.contains(history) {
        result.append(history)
    }
    
    // combination
    if let tickets = tickets {
        for (index, ticket) in tickets.enumerated() {
            if var _t = visited[key], !_t[index] {
                _t[index] = true
                visited.updateValue(_t, forKey: key)
                history.append(ticket)
                combination(hash: hash, history: history, n: n)
                history.removeLast()
                _t[index] = false
                visited.updateValue(_t, forKey: key)
            }
        }
    }
    else {
        return
    }
}