import Foundation

@Observable
class MathGameViewModel {
    var gameModel: GameModel = GameModel.defaultValue
    
    
    var score: Int {
        gameModel.score
    }
    
    var nextLevel: Bool {
        problemCount % nextLevelBound == 0
    }
    
    var number1: Int {
        gameModel.currentProblem.number1
    }
    
    var number2: Int {
        gameModel.currentProblem.number2
    }
    
    var posibleSolution: [Int] {
        gameModel.currentProblem.solutions.shuffled()
    }
    
    var answer: Int {
        gameModel.currentProblem.answer
    }
    
    var gameOver: Bool {
        gameModel.gameOver
    }
    
    private let nextLevelBound = 5
    private let maxIncreseScore = 10
    private var problemCount = 0
    
    func generateNextProblem() {
        gameModel.currentProblem = ProblemModel(level: gameModel.level)
        
        problemCount += 1
        
        if nextLevel {
            gameModel.level += 1
        }
        
    }
    
    func increaseScore() {
        gameModel.score += min(gameModel.level, maxIncreseScore)
    }
    
    func loseLife() {
        gameModel.lives = max(gameModel.lives - 1, 0)
        gameModel.score = max(gameModel.score - 2, 0)
    }
    
    func reset() {
        gameModel = GameModel.defaultValue
        problemCount = 0
    }
}
