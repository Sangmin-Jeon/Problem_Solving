import Foundation

let N = Int(readLine()!) ??  0

for num in N ..< Int.max {
    if isPrimeNumber(n: num) {
        var r_num = String(num).reversed()
        if String(num) == String(r_num) {
            print(num)
            break
        }
    }
}


func isPrimeNumber(n: Int) -> Bool {
    if n < 2 {
        return false
    }
    for i in 2 ..< Int(sqrt(Double(n)) + 1) {
        if n % i == 0 { return false }
    }
    return true
}