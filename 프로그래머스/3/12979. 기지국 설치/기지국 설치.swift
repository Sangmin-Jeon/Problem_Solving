import Foundation

func solution(_ n: Int, _ stations: [Int], _ w: Int) -> Int {
    var stationCnt = 0
    var currentPos = 1
    var index = 0
    
    while currentPos <= n {
        if index < stations.count && currentPos >= (stations[index] - w) {
            currentPos = stations[index] + w + 1
            index += 1
        } 
        else {
            stationCnt += 1
            currentPos += 2 * w + 1
        }
    }

    return stationCnt
}