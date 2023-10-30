import Foundation

let n = Int(readLine()!) ?? 0
var node = [(Int, Int)]()
for _ in 0 ..< n - 1 {
    if let input = readLine() {
        let _node = input.split(separator: " ").map({ Int($0)! })
        node.append((_node.first!, _node.last!))
    }
}

var tree = [Int: [Int]]()
for _node in node {
    if let values = tree[_node.0] {
        tree[_node.0] = values + [_node.1]
    }
    else {
        tree.updateValue([_node.1], forKey: _node.0)
    }

    if let values = tree[_node.1] {
        tree[_node.1] = values + [_node.0]
    }
    else {
        tree.updateValue([_node.0], forKey: _node.1)
    }
}

var visited = [Int: Bool]()
var memo = [Int: Int]()
treeDFS(n: 1)

func treeDFS(n: Int) {
    guard let values = tree[n], 
            !values.isEmpty else { return }

    visited[n] = true

    for i in values {
        if visited[i] == nil {
            memo[i] = n
            treeDFS(n: i)
        }
    }
    
}

// 출력
for i in 2 ... n {
    print(memo[i] ?? 0)

}