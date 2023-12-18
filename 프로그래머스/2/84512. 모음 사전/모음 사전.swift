import Foundation

var stack = [String]()
var count = 0

func solution(_ word:String) -> Int {
    let word = word.map({ String($0) })
    let _ = DFS(word: word, words: ["A", "E", "I", "O", "U"])
    return count
}


func DFS(word: [String], words: [String]) -> Bool {
    if word == stack {
        return true
    }
    
    count += 1

    for w in words {
        if stack.count < 5 {
            stack.append(w)
            if DFS(word: word, words: words) {
                return true
            }
            stack.removeLast()
        }
    }
    
    return false

}