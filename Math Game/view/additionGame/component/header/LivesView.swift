import SwiftUI

struct LivesView: View {
    let imageName: Creatures
    let numLives: Int
    let maxLives: Int
    
    private let dim = 30.0
    
    var body: some View {
        HStack {
            ForEach(0 ..< maxLives, id: \.self) { i in
                let opacity: CGFloat = i >= numLives ? 0 : 1
                Image(imageName.rawValue)
                    .resizable()
                    .scaledToFit()
                    .opacity(opacity)
                    .frame(width: dim, height: dim)
            }
        }
    }
}

#Preview {
    LivesView(
        imageName: .creature1,
        numLives: 2,
        maxLives: 3
    )
}
