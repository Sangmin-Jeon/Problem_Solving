import Foundation


func solution(_ storey:Int) -> Int {
    var storey = storey
    var result = 0
    
    while storey != 0 {
        let n = storey % 10
        
        if n >= 6 || (n == 5 && (storey / 10) % 10 >= 5) {
            storey += 10 - n
            result += 10 - n
        } 
        else {
            result += n
        }
        storey /= 10
    }
    
    return result
}




