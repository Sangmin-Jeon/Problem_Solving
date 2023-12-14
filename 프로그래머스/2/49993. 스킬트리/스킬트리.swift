import Foundation

var skills = [String: Int]()

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var answer = 0
    let skillList = skill.map({ String($0) })
    for (i, s) in skillList.enumerated() {
        skills[s] = i
    }

    for skill_tree in skill_trees {
        var learnSkills = Array(repeating: false, count: skillList.count)
        var skillTree = skill_tree.map({ String($0) })
        var canLearn = true
        while !skillTree.isEmpty {
            let skill = skillTree.removeFirst()
            if let order = skills[skill] {
                if order == 0 || order - 1 >= 0 && learnSkills[order - 1] {
                    learnSkills[order] = true   
                }
                else {
                    canLearn = false
                }
            }

        }
        if skillTree.isEmpty, canLearn {
            answer += 1
        }

    }

    return answer
}