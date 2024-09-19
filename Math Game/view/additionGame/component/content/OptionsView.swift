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
                SelecteButtonView(option: option, gameVm: gameVm)
            }
            
        }
    }
}

#Preview {
    OptionsView(gameVm: .init())
}
