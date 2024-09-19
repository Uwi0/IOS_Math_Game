
import SwiftUI

struct HighScoreTitleView: View {
    var body: some View {
        HStack {
            VTextImageView(imageName: "creature0", text: "Rank", dim: 25)
            VTextImageView(imageName: "creature1", text: "Score", dim: 25)
            VTextImageView(imageName: "creature2", text: "Name", dim: 25)
        }.padding(.horizontal, 10)
    }
}

#Preview {
    HighScoreTitleView()
}
