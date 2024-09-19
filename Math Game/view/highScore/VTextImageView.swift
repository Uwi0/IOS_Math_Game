import SwiftUI

struct VTextImageView: View {
    let imageName: String
    let text: LocalizedStringKey
    let dim: Double
    
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: dim, height: dim)
            
            Text(text)
                .fixedSize(horizontal: true, vertical: false)
                .foregroundStyle(.white)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    VTextImageView(
        imageName: "creature0",
        text: "Rank",
        dim: 50
    )
}
