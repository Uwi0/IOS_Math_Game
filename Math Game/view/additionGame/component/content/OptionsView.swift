import SwiftUI

struct OptionsView: View {
    let gameVm: MathGameViewModel
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(gameVm.posibleSolution, id: \.self){ option in
                let cheatColor: Color = .black
                BubbleView(
                    txtColor: cheatColor,
                    bgColor: .purple.opacity(0.7),
                    name: "bubble2",
                    text: "\(option)"
                )
                .onTapGesture {
                    withAnimation {
                        if gameVm.answer == option {
                            gameVm.increaseScore()
                        } else {
                            gameVm.loseLife()
                        }
                        gameVm.generateNextProblem()
                    }
                }
            }
            
        }
    }
}

#Preview {
    OptionsView(gameVm: .init())
}
