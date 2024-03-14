import Foundation

// // 전체 단품 내역 리스트 구하기
// func getTotalOrders(_ orders:[String]) -> [String] {
//     var setOrders = Set<String>()
//     for order in orders {
//         order.forEach({ 
//             setOrders.insert(String($0))  
//         })
//     }
//     return [String](setOrders)
// }

// // 코스 요리 수에 따른 조합 구하기
// func combination(_ totalOrders: [String], _ index: Int, _ combi:[String], _ target: Int, _ list: inout [[String]]) {
//     if combi.count == target {
//         list.append(combi)
//         return
//     }
//     for i in index ..< totalOrders.count {
//         combination(totalOrders, i + 1, combi + [totalOrders[i]], target, &list)
//     }
// }

// func solution(_ orders:[String], _ course:[Int]) -> [String] {
//     var answer = [String]()
//     let totalOrders = getTotalOrders(orders)
//     for target in course {
//         var list = [[String]]()
//         combination(totalOrders, 0, [], target, &list)
//         for _course in makeCourse(orders, list, target) {
//             answer.append(_course)   
//         }
//     }
//     answer.sort()
    
//     return answer
// }

// func makeCourse(_ orders: [String], _ list: [[String]], _ target: Int) -> [String] {
//     var answer = [[String]]()
    
//     var list = list
    
//     var hash = [String: Int]()
    
//     while !list.isEmpty {
//         var pop = list.removeFirst()
//         var count = 0
//         for order in orders {
//             let temp = order.map({ String($0) })
//             var hit = 0
//             for elem in pop {
//                 if temp.contains(elem) {
//                     hit += 1
//                 }
//             }
//             if hit == target {
//                 count += 1
//             }
//         }
//         if count >= 2 {
//             pop.sort()
//             hash[pop.reduce("", +), default: 0] = count
//         }
//     }

//     let maxVal = hash.values.max()
    
//     return hash.filter({ $0.value == maxVal }).map({ $0.key })
// }



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






