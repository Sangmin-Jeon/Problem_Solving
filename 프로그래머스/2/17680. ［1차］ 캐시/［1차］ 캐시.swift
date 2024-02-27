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
                time += 1
            }
        } 
        else {
            if DBCache.count == cacheSize {
                DBCache.removeLast()
            }
            time += 5
        }
        DBCache = [_city] + DBCache
    }

    return time

}