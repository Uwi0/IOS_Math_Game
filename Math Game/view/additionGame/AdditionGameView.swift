import SwiftUI

struct AdditionGameView: View {
    
    private var gameVM = MathGameViewModel()
    @Environment(HighScoreViewModel.self) private var highScoreVM: HighScoreViewModel
    @State private var showHighScoreView: Bool = false
    @State private var name: String = ""
    
    private var showGameOverView: Bool {
        gameVM.gameOver
    }
    
    private var showHighScore: Bool {
        gameVM.gameOver && highScoreVM.isNewHighScore(score: gameVM.score)
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
        .onChange(of: showHighScore) { newValue in
            showHighScoreView = newValue
        }
        
    }
}

#Preview {
    AdditionGameView()
        .environment(HighScoreViewModel())
}
