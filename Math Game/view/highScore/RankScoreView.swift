import SwiftUI

struct RankScoreView: View {
    
    let rank: Int
    let score: Int
    let entity: HighScoreEntity
    
    @EnvironmentObject private var highScoreVM: HighScoreViewModel
    @State private var editMode = false
    @State private var name: String = ""
    @State private var save: Bool = false
    private var color: Color {
        scoreColors[(rank - 1) % scoreColors.count]
    }
    
    private let scoreColors: [Color] = [.blue, .pink, .yellow, .orange, .red]
    
    var body: some View {
        HStack {
            if editMode {
                TextField(entity.name ?? "name", text: $name)
                    .padding()
                    .background(.green.gradient)
                    .foregroundStyle(.black)
                    .cornerRadius(10)
                
                Button(
                    action: {
                        highScoreVM.updateHighScore(entity: entity, name: name)
                        withAnimation {
                            editMode.toggle()
                        }
                    },
                    label: {
                        Text("Save")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.red.gradient)
                            .cornerRadius(10)
                    }
                )
            } else {
                Text("Displaying score data")
                    .onTapGesture {
                        withAnimation {
                            editMode.toggle()
                        }
                    }
            }
            
        }
    }
}
