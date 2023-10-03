let vowel = ["a", "e", "i", "o", "u"]

func getPassword(l: Int, c: Int, list: [String]) {
    var visited = Array(repeating: false , count: c)
    var permutation = [String]()
    dfs(l: l, c: c, list: list, word: "", visited: &visited, permutation: &permutation)
}

func dfs(l: Int, c: Int, list: [String], word: String, visited: inout [Bool], permutation: inout [String]) {
    if permutation.count == l {
        var vowelCnt = 0
        var consonant = 0
        for s in permutation {
            if vowel.contains(s) {
               vowelCnt += 1 
            }
            else {
                consonant += 1
            }
        }   

        if vowelCnt == 0 || consonant < 2 {
            return
        }

        let p = permutation.reduce("", +)
        // 여기서 출력
        print(p)
        return 
    }

    for (index, _word) in list.enumerated() {
        if !visited[index], (permutation.last ?? "") < _word {
            visited[index] = true
            permutation.append(_word)
            dfs(l: l, c: c, list: list, word: _word, visited: &visited, permutation: &permutation)
            permutation.removeLast()
            visited[index] = false
        }
    }
}

if let input = readLine() {
    let integers = input.split(separator: " ").compactMap { Int($0) }
    
    if integers.count == 2, let L = integers.first, let C = integers.last, (3...15).contains(L), (L...15).contains(C) {
        // C개의 문자 입력 받기
        if let charInput = readLine() {
            let characters = charInput.split(separator: " ")
            
            if characters.count == C {
                // 입력된 문자들을 배열로 저장하고 정렬
                var charArray = characters.map { String($0) }
                charArray.sort()
                
                // 이제 원하는 작업을 수행하면 됩니다.
                // 예: charArray를 이용한 조합 생성 또는 다른 작업
                getPassword(l: L, c: C, list: charArray)
            }
        }
    }
}