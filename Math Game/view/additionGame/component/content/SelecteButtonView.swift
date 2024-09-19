import SwiftUI

struct SelecteButtonView: View {
    let option: Int
    let gameVm: MathGameViewModel
    @State var selectedOption: Int? = nil
    
    
    private var isSelected: Bool {
        selectedOption == option
    }
    
    private var scale: CGFloat {
        isSelected ? 1.2 : 1
    }
    
    private var color: Color {
        isSelected ? generateRandomColor() : .purple.opacity(0.7)
    }
    
    var body: some View {
        BubbleView(
            txtColor: .black,
            bgColor: color,
            name: "bubble2",
            text: "\(option)"
        )
        .scaleEffect(scale)
        .onTapGesture {
            withAnimation(
                .spring(response: 0.3, dampingFraction: 0.3)
                .repeatCount(1, autoreverses: true)
            ) {
                selectedOption = option
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {
                    selectedOption = nil
                }
            }
            
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
    
    func generateRandomColor() -> Color {
        return [
            .green.opacity(0.7),
            .red,
            .blue.opacity(0.7)
        ].randomElement() ?? .green.opacity(0.7)
    }
}
