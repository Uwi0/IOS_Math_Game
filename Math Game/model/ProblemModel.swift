import Foundation

struct ProblemModel: Identifiable {
    let id = UUID()
    let number1: Int
    let number2: Int
    let level: Int
    let solutions: [Int]
    
    var answer: Int {
        solutions[0]
    }
    
    init (level: Int) {
        self.level = level
        let lower = (level - 1) * 5
        let upper = level * 5
        self.number1 = Int.random(in: lower...upper)
        self.number2 = Int.random(in: lower...upper)
        let answer = number1 + number2
        
        var newSolutions: [Int] = []
        newSolutions.append(answer)
        newSolutions.append(answer + 10)
        let belowAnswer = max(0, answer - 5)
        let aboveAnswer = answer + 5
        newSolutions.append(Int.random(in: answer+1...aboveAnswer))
        newSolutions.append(Int.random(in: belowAnswer..<answer))
        self.solutions = newSolutions
    }
    
    func checkSolution(value: Int) -> Bool {
        !solutions.isEmpty && value == answer
    }
    

}
