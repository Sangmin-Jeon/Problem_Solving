func setList(begin: String, words: [String]) -> [String: [String]] {
    let lng = begin.count
    var result = [String: [String]]()
    
    var list = [String: String]()
    words.forEach { word in
        list.updateValue("", forKey: word)
    }
    
    var _words = [begin] + words
    
    _words.forEach { _word in
        list.forEach { word, _ in
            var cnt = 0
            var idx = 0
            
            for (char1, char2) in zip(_word, word) {
                idx += 1
                if char1 != char2 {
                    cnt += 1
                }
                if idx == lng, cnt == 1 {
                    var val = result[_word] ?? []
                    val.append(word)
                    result.updateValue(val, forKey: _word)
                }
            }
        }
    }
    
    return result
}

func solution(_ begin: String, _ target: String, _ words:[String]) -> Int {
    if !words.contains(target) {
        return 0
    }
    let wordList = setList(begin: begin, words: words)
    let result = bfs(begin: begin, target: target, wordList: wordList)
    
    return result
}

func bfs(begin: String, target: String,  wordList: [String: [String]]) -> Int {
    var result = 0
    var visited = [String: String]()
    var queue = [(String, Int)]()
    queue.append((begin, 0))
    
    while !queue.isEmpty {
        let visit = queue.removeFirst()
        visited.updateValue("", forKey: visit.0)
        
        if let list = wordList[visit.0] {
            for word in list {
                if visited[word] == nil {
                    queue.append((word, (visit.1 + 1)))
                }
                if word == target {
                    result = queue.last!.1
                    return result
                }
            }
        }
    }
    
    return result
}