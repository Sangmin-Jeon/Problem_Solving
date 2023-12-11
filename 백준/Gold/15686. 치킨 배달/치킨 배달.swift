import Foundation

var selectedChicken = [[Int]]()

func DFS(_ list:[Int],_ n:Int,_ r:Int,_ idx:Int,_ selected: inout [Int]) -> Void{
    if(r == 0){
        selectedChicken.append(selected)
        return
    }
    
    for i in idx..<n{
        selected.append(i)
        DFS(list, n, r-1, i+1, &selected)
        selected.removeLast();
    }
    
}

struct node{
    var r: Int
    var c: Int
}

let input = readLine()!.split(separator: " ").map{Int(String($0))!}

let n = input[0]
let m = input[1]

var city = [[Int]]()

var house = [node]()

var chicken = [node]()

for i in 0..<n{
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    for j in 0..<n where line[j] == 1 || line[j] == 2{
        if line[j] == 1{
            house += [node(r: i, c: j)]
        }else{
            chicken += [node(r: i, c: j)]
        }
    }
}

var list = Array<Int>()
for i in 0..<chicken.count{
    list.append(i)
}

var selected = [Int]()

DFS(list, list.count, m, 0, &selected)

func dist(a:[node], b:[node])->Int{
    var sum = 0
    for i in a{
        var distance = 1000
        for j in b{
            distance = min(distance, abs(i.r - j.r) + abs(i.c - j.c))
        }
        sum += distance
    }
    return sum
}

var result = 10000
for l in selectedChicken{
    var s = [node]()
    for i in l{
        s.append(chicken[i])
    }
    result = min(result, dist(a: house, b: s))
}

print(result)