import Foundation

var form: String = ""

func input() {
    let tc = Int(readLine()!)!
    for _ in 0 ..< tc {
        let N = Int(readLine()!)!
        DFS(0, 1, 1, 1, N, "1")
        print()
    }
}

func DFS(_ sum: Int, _ flag: Int, _ num: Int, _ n: Int, _ N: Int, _ form: String) {
    if n == N {
        let newSum = sum + (num * flag)
        if newSum == 0 {
            print(form)
        }
        return
    }
    DFS(sum, flag, num * 10 + (n + 1), n + 1, N, form + " " + String(n + 1))
    DFS(sum + (flag * num), 1, n + 1, n + 1, N, form + "+" + String(n + 1))
    DFS(sum + (flag * num), -1, n + 1, n + 1, N, form + "-" + String(n + 1))
}

input()
