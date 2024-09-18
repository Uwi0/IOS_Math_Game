import SwiftUI

struct BubbleView: View {
    
    let txtColor: Color
    let bgColor: Color
    let name: String
    let text: String
    
    private let bubbleSize: CGFloat = 200
    @State private var rotate = 0.0
    
    
    var body: some View {
        ZStack {
            Text(text)
                .foregroundStyle(txtColor)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding()
                .background(
                    Image(name)
                        .resizable()
                        .scaledToFill()
                        .opacity(0.6)
                        .rotationEffect(.degrees(rotate))
                        .background(bgColor)
                        .clipShape(Circle())
                )
                .padding()
                .onAppear {
                    withAnimation(.linear(duration: 20)
                        .repeatForever(autoreverses: false )
                    ) {
                        rotate = 360
                    }
                }
                
        }
    }
}

#Preview {
    VStack {
        BubbleView(
            txtColor: .white,
            bgColor: .purple.opacity(0.4),
            name: "bubble1",
            text: "25"
        )
        BubbleView(
            txtColor: .black,
            bgColor: .purple.opacity(0.4),
            name: "bubble2",
            text: "25"
        )
        BubbleView(
            txtColor: .white,
            bgColor: .purple.opacity(0.4),
            name: "bubble3",
            text: "25"
        )
    }
}
