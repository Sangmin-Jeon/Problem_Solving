import Foundation

func getTotalOrders(_ orders: [String]) -> [String] {
    var setOrders = Set<String>()
    orders.forEach { order in
        order.forEach { item in
            setOrders.insert(String(item))
        }
    }
    return Array(setOrders).sorted()
}

func getCombinationCounts(_ orders: [String], _ courseSize: Int) -> [String: Int] {
    var counts = [String: Int]()
    
    func dfs(_ order: [String], _ index: Int, _ combination: [String]) {
        if combination.count == courseSize {
            let key = combination.joined()
            counts[key, default: 0] += 1
            return
        }
        
        for i in index..<order.count {
            dfs(order, i + 1, combination + [order[i]])
        }
    }
    
    for order in orders {
        let sortedOrder = order.sorted().map(String.init)
        dfs(sortedOrder, 0, [])
    }
    
    return counts
}

func solution(_ orders: [String], _ course: [Int]) -> [String] {
    var answer = [String]()
    
    for courseSize in course {
        let counts = getCombinationCounts(orders, courseSize)
        if let maxCount = counts.values.max(), maxCount >= 2 {
            let maxCourses = counts.filter { $0.value == maxCount }.keys.sorted()
            answer.append(contentsOf: maxCourses)
        }
    }
    
    return answer.sorted()
}