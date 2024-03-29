import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var list = Array(repeating: [String](repeating: "", count: 1), count: banned_id.count)
    for idx in 0 ..< banned_id.count {
        var idxes = [Int]()
        let _banned = banned_id[idx].map({ String($0) })
        for i in 0 ..< _banned.count {
            if _banned[i] != "*" {
                idxes.append(i)
            }
        }
        
        list[idx] = checkCharAndChar(idxes, user_id, banned_id[idx])
    }

    return combination(banned_id.count, list)
}

func checkCharAndChar(_ idxes: [Int], _ user_id: [String], _ banned: String) -> [String] {
    var result = [String]()
    let bannedId = banned.map({ String($0) })
    for user in user_id {
        var isBanned = true
        let _user = user.map({ String($0) })
        if _user.count != bannedId.count {
            continue
        }
        for idx in idxes {
            if _user[idx] != bannedId[idx] {
                isBanned = false
                break
            }
        }
        if isBanned {
            result.append(user)
        }
    }
    return result
}

func combination(_ target: Int, _ list: [[String]]) -> Int {
    var result = [[String]]()
    var arr = [String]()
    func dfs(_ idx: Int) {
        if target == arr.count {
            let s_arr = arr.sorted(by: <)
            result.append(s_arr)
            return
        }
        for i in 0 ..< list[idx].count {
            if !arr.contains(list[idx][i]) {
                arr.append(list[idx][i])
                dfs(idx + 1)
                arr.removeLast()
            }
            
        }
    }
    dfs(0)
    return Set(result).count
}


