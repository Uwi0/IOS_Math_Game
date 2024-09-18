import SwiftUI

struct GameBackgroundView: View {
    var body: some View {
        BackgroundView(
            colors: [
                .purple,
                .pink,
                .clear
            ],
            opacitiy: 0.7
        )
    }
}

#Preview {
    GameBackgroundView()
}
