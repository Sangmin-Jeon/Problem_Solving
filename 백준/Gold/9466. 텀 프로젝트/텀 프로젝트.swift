import Foundation

for _ in 0 ..< Int(readLine()!)! {
    let students = Int(readLine()!) ?? 0
    let stuList = readLine()!.split(separator: " ").map{ Int(String($0)) ?? 0 }
    
    var visited = Array(repeating: false, count: students)

    let answer = count_outSider(students: students, stuList: stuList, visited: &visited)
    print(answer)

}

func count_outSider(students: Int, stuList: [Int], visited: inout [Bool]) -> Int {
    var answer = 0
    var team = [Int]()
    for stu in 1 ... students {
        if !visited[stu - 1] {
            team = []
            answer += dfs(stu: stu, stuList: stuList, team: &team, visited: &visited)
        }
    }

    return (students - answer)
}


func dfs(stu: Int, stuList: [Int], team: inout [Int], visited: inout [Bool]) -> Int {
    let stuIndex = stu - 1
    team.append(stu)
    visited[stuIndex] = true

    let chooseStu = stuList[stuIndex]

    if visited[chooseStu - 1] {
        if team.contains(chooseStu) {
            if let startIndex = team.firstIndex(of: chooseStu) {
                let sublist = Array(team[startIndex...])
                return sublist.count
            }
        }
        return 0
    }

    return dfs(stu: chooseStu, stuList: stuList, team: &team, visited: &visited)
}
