import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var time = 0
    var DBCache = [String]()

    if cacheSize == 0 {
        return cities.count * 5
    }

    for city in cities {
        let _city = city.lowercased()
        if DBCache.contains(_city) {
            if let idx = DBCache.firstIndex(of: _city) {
                DBCache.remove(at: idx)
                DBCache = [_city] + DBCache
                time += 1
            }
        } 
        else {
            if DBCache.count == cacheSize {
                DBCache.removeLast()
            }
            DBCache = [_city] + DBCache
            time += 5
        }
    }

    return time

}