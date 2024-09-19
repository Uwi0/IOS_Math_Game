import SwiftUI

struct EnterNewHighScoreView: View {
    
    let score: Int
    @Binding var name: String
    @Binding var isPresented: Bool
    @EnvironmentObject var highScoreVM: HighScoreViewModel
    
    var body: some View {
        ZStack {
            BackgroundView(colors: [.blue, .purple], opacitiy: 1)
            VStack {
                Text("New High Score!")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .padding()
                
                Text("\(score)")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding()
                
                TextField("Enter Name", text: $name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .autocorrectionDisabled(true)
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .padding()
                
                Button(
                    action: {
                        name = name.isEmpty ? "Anon" : name
                        highScoreVM.addHighScore(name: name, score: Int64(score))
                        isPresented = false
                    },
                    label: {
                        Text("Save")
                            .font(.title)
                            .foregroundStyle(.white)
                            .padding()
                            .background(.green)
                            .cornerRadius(10)
                    })
            }
        }
    }
}

#Preview {
    EnterNewHighScoreView(
        score: 123,
        name: .constant("Peno"),
        isPresented: .constant(true)
    )
    .environmentObject(HighScoreViewModel())
}
