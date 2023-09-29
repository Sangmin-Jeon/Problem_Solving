var visited = [Bool]()
var memo = [[String]: Int]()

func calNumber(n: Int, numbers: [Int], operators: [Int]) -> (Int, Int) {
    var oper = [String]()
    for add in 0 ..< operators[0] {
        oper.append("+")
    }
    
    for min in 0 ..< operators[1] {
        oper.append("-")
    }
    
    for mul in 0 ..< operators[2] {
        oper.append("*")
    }
    
    for div in 0 ..< operators[3] {
        oper.append("/")
    }
    visited = Array(repeating: false, count: oper.count)
    var comb = [String]()
    combinaion(numbers: numbers, oper: oper, comb: &comb)
    return (history.max()!, history.min()!)
    
}

var history = [Int]()

func combinaion(numbers: [Int], oper: [String], comb: inout [String]) {
    if comb.count == operatorsSum {
        if let _ = memo[comb] {
            return
        }
        var result = 0
        var _comb = comb
        var _oper = _comb.removeFirst()
        if numbers.count >= 2 {
            switch _oper {
            case "+":
                result = numbers[0] + numbers[1]
            case "-":
                result = numbers[0] - numbers[1]
            case "*":
                result = numbers[0] * numbers[1]
            case "/":
                result = numbers[0] / numbers[1]
            default:
                break
            }
            for i in 2 ..< numbers.count {
                _oper = _comb.removeFirst()
                switch _oper {
                case "+":
                    result += numbers[i]
                case "-":
                    result -= numbers[i]
                case "*":
                    result *= numbers[i]
                case "/":
                    result /= numbers[i]
                default:
                    break
                }
            }
        }
        history.append(result)
        memo.updateValue(result, forKey: comb)
        return
    }
    
    
    for (index, op) in oper.enumerated() {
        if !visited[index] {
            visited[index] = true
            comb.append(op)
            combinaion(numbers: numbers, oper: oper, comb: &comb)
            visited[index] = false
            comb.removeLast()
        }
    }
}

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
let operators = readLine()!.split(separator: " ").map { Int($0)! }
let operatorsSum = operators.reduce(0, +)

let sol = calNumber(n: n, numbers: numbers, operators: operators)
print(sol.0)
print(sol.1)

