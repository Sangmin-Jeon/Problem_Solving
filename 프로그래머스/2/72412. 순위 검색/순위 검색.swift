import Foundation

func setHash(_ info:[String]) -> [String : [Int]] {
    var hash = [String : [Int]]()

    for _info in info {
        let temp = _info.components(separatedBy: " ")
        let languages = [temp[0], "-"]
        let jobs = [temp[1], "-"]
        let careers = [temp[2], "-"]
        let soulFoods = [temp[3], "-"]
        let score = Int(temp[4])!

        for language in languages {
            for job in jobs {
                for career in careers {
                    for soulFood in soulFoods {
                        let key = String("\(language)\(job)\(career)\(soulFood)")
                        hash[key, default: []].append(score)
                    }
                }
            }
        }
    }  
    
    hash.forEach({
        hash[$0] = $1.sorted() 
    }) 
    
    return hash
}


func solution(_ info:[String], _ query:[String]) -> [Int] {
    return countMatchedTarget(
        query, 
        setHash(info)
    )
}

func countMatchedTarget(_ query:[String], _ hash: [String : [Int]]) -> [Int] {
    var result = [Int](repeating: 0, count: query.count)
    for idx in 0 ..< query.count {
        let target = query[idx].split(separator: " ")
        let key = String("\(target[0])\(target[2])\(target[4])\(target[6])")
        let score = Int(target[7])!
        
        if let list = hash[key] {
            result[idx] = binarySearch(list, score)
        }
    }
    return result
}

func binarySearch(_ scoreList: [Int], _ score: Int) -> Int {
    var st = 0
    var ed = scoreList.count - 1
    var mid = 0

    while st <= ed {
        mid = (st + ed) / 2
        if scoreList[mid] < score {
            st = mid + 1
        } 
        else {
            ed = mid - 1
        }
    }
    
    return Int(scoreList.count - st)
}


