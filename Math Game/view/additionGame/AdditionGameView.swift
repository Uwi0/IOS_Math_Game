import SwiftUI

struct AdditionGameView: View {
    
    private var gameVM = MathGameViewModel()
    
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
            }
        }
    }
}

#Preview {
    AdditionGameView()
}
