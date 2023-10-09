import Foundation

let count = Int(readLine()!)!
var results: [String] = ["", "", ""]
var tree = [String: [String]]()
for _ in 0..<count {
    let input = readLine()!.split { $0 == " " }.map { String($0)}
    tree.updateValue([input[1], input[2]], forKey: input[0])
}

func dfs(node: String) {
    if node == "." {
        return
    }

    results[0] += node
    dfs(node: tree[node]![0])
    results[1] += node
    dfs(node: tree[node]![1])
    results[2] += node

}

dfs(node: "A")

for i in results {
    print(i)
}