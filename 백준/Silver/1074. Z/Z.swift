func findZ(_ n: Int, _ r: Int, _ c: Int) -> Int {
    if n == 0 {
        return 0
    }
    
    let halfSize = 1 << (n - 1) // 2^(n-1)
    let quadrantSize = halfSize * halfSize
    
    if r < halfSize && c < halfSize {
        return findZ(n - 1, r, c) // 1사분면
    }
    else if r < halfSize && c >= halfSize {
        return quadrantSize + findZ(n - 1, r, c - halfSize) // 2사분면
    }
    else if r >= halfSize && c < halfSize {
        return 2 * quadrantSize + findZ(n - 1, r - halfSize, c) // 3사분면
    }
    else {
        return 3 * quadrantSize + findZ(n - 1, r - halfSize, c - halfSize) // 4사분면
    }
    
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let r = input[1]
let c = input[2]

let result = findZ(n, r, c)
print(result)