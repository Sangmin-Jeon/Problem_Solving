import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var plays = plays
    var hash = [String: Int]()
    getTopPlayed(genres, plays, &hash)
    let topPlayed = hash.sorted(by: { $0.value > $1.value })
    print(topPlayed)

    var visited = Array(repeating: false, count: plays.count)
    var foo = [[Int]]()
    for (ctg, _) in topPlayed {
        var temp = [(Int, Int)]()
        for i in 0 ..< plays.count {
            if genres[i] == ctg {
                temp.append((i, plays[i]))
            }
        }
        let sorting = temp.sorted(by: { $0.1 > $1.1 })
        var bar = [Int]()
        for i in sorting {
            if bar.count < 2 {
                bar.append(i.0)
            }
        }
        foo.append(bar)
    }

    var result = [Int]()
    for i in foo {
        result += i
    }    

    return result
}

func getTopPlayed(_ genres:[String], _ plays:[Int], _ hash: inout [String: Int]) {
    for i in 0 ..< genres.count {
        if let play = hash[genres[i]] {
            hash.updateValue(plays[i] + play, forKey: genres[i])
            continue
        }
        hash.updateValue(plays[i], forKey: genres[i])
    }
}