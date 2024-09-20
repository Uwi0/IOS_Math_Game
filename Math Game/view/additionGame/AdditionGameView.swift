import SwiftUI
import SwiftData

struct AdditionGameView: View {
    
    private var gameVM = MathGameViewModel()
    private let maxNumberOfHighScores: Int = 10
    
    @State private var showHighScoreView: Bool = false
    @State private var name: String = ""
    @Query var highScores: [HighScoreEntity] = []
    
    private var showGameOverView: Bool {
        gameVM.gameOver
    }
    
    private var minHighScore: Int? {
        if highScores.isEmpty { return nil }
        else { return orderedHighScores.last?.score }
    }
    
    var orderedHighScores: [HighScoreEntity] {
        highScores.sorted{ score1, score2 in score1.score > score2.score }
    }
    
    private var showHighScore: Bool {
        gameVM.gameOver && isNewHighScore(score: gameVM.score)
    }
    
    var body: some View {
        ZStack {
            GameBackgroundView()
            VStack {
                ScoreLivesView(
                    score: gameVM.score,
                    lives: gameVM.gameModel.lives,
                    maxLives: 3,
                    level: gameVM.gameModel.level
                )
                Spacer()
                BubbleView(
                    txtColor: .white,
                    bgColor: .purple.opacity(0.7),
                    name: "bubble3",
                    text: "\(gameVM.number1) + \(gameVM.number2)"
                )
                Spacer()
                OptionsView(gameVm: gameVM)
            }
            .padding()
            .blur(radius: showGameOverView ? 5 : 0)
            .disabled(showGameOverView)
            
            GameOverView()
                .padding()
                .blur(radius: showGameOverView ? 0 : 30)
                .opacity(showGameOverView ? 1 : 0)
                .disabled(!showGameOverView)
                .onTapGesture {
                    gameVM.reset()
                }
        }
        .fullScreenCover(
            isPresented: $showHighScoreView,
            onDismiss: { gameVM.reset() }
        ) {
            EnterNewHighScoreView(
                score: gameVM.score,
                name: $name,
                isPresented: $showHighScoreView
            )
        }
        .onChange(of: showHighScore) {
            showHighScoreView = showHighScore
        }
        
    }
    
    private func isNewHighScore(score: Int) -> Bool {
        if score <= 0 {
            return false
        } else if let minHighScore {
            return minHighScore < score || highScores.count <= maxNumberOfHighScores
        } else {
            return true
        }
    }
}

#Preview {
    AdditionGameView()
        .modelContainer(for: HighScoreEntity.self)
}
