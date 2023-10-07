import Foundation

// 첫 번째 줄에서 N과 M을 읽어옵니다.
let input1 = readLine()!.split(separator: " ")
let N = Int(input1[0])! // 칭호의 개수 N
let M = Int(input1[1])! // 캐릭터의 개수 M

// 칭호와 전투력 상한값을 저장할 배열
var rank = [(String, Int)]()

// N개의 줄에서 칭호와 전투력 상한값을 읽어와서 배열에 저장합니다.
for _ in 0 ..< N {
    let titleInput = readLine()!.split(separator: " ")
    let title = String(titleInput[0])
    let powerLimit = Int(titleInput[1])!
    rank.append((title, powerLimit))
}

var userPower = [Int]()
// M개의 줄에서 캐릭터의 전투력을 읽어와서 칭호를 출력합니다.
for _ in 0 ..< M {
    let characterPower = Int(readLine()!)!
    userPower.append(characterPower)
}
 
// 각 캐릭터에 대해 칭호를 출력합니다.
for user in userPower {
    let setRank = binarySearch(start: 0, end: (rank.count - 1), user: user)
    print(setRank)
}

// 이분 탐색
func binarySearch(start: Int, end: Int, user: Int) -> String {
    var result = ""

    var start = start
    var end = end

    while start <= end {
        let mid = (start + end) / 2

        if rank[mid].1 >= user {
            end = mid - 1
            result = rank[mid].0
        } else {
            start = mid + 1
        }
    }

    return result
}