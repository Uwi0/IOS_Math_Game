import SwiftUI

struct GameOverView: View {
    var body: some View {
        HStack {
            Label(
                title: {
                    Text("Game Over")
                        .multilineTextAlignment(.center)
                    Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.yellow)
                },
                icon: {
                    Image(Creatures.creature5.rawValue)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .scaledToFit()
                        .padding()
                        .background(.green)
                        .clipShape(Circle())
                }
            )
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .cornerRadius(10)
            .shadow(radius: 3)
            
        }
    }
}

#Preview {
    GameOverView()
}
