import SwiftUI

struct HighScoreView: View {
    var body: some View {
        ZStack {
            HighScoreBackgroundView()
            Text("HighScoreView")
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    HighScoreView()
}
