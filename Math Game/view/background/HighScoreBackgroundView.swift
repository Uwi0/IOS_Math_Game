import SwiftUI

struct HighScoreBackgroundView: View {
    var body: some View {
        BackgroundView(
            colors: [
                .black,
                .black,
                .gray
            ],
            opacitiy: 0.7
        )
    }
}

#Preview {
    HighScoreBackgroundView()
}
