import SwiftUI

struct AdditionGameView: View {
    
    private var gameVM = MathGameViewModel()
    
    private var showGameOverView: Bool {
        gameVM.gameOver
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
    }
}

#Preview {
    AdditionGameView()
}
