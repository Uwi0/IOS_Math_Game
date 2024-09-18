import SwiftUI

struct BackgroundView: View {
    let colors: [Color]
    let opacitiy: Double
    
    
    var body: some View {
        LinearGradient(
            colors: colors,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .opacity(opacitiy)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView(
        colors: [
            .purple,
            .pink,
            .clear
        ],
        opacitiy: 0.7
    )
}
