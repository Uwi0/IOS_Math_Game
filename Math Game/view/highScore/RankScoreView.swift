import SwiftUI
import SwiftData

struct RankScoreView: View {
    
    let rank: Int
    let score: Int
    let entity: HighScoreEntity
    
    @Query private var highScore: [HighScoreEntity] = []
    @Environment(\.modelContext) var modelContext
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
                TextField(entity.name, text: $name)
                    .padding()
                    .background(.green.gradient)
                    .foregroundStyle(.black)
                    .cornerRadius(10)
                
                Button(
                    action: {
                        
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
                HStack {
                    Text(rank.ordinal)
                        .frame(maxWidth: .infinity)
                    Text("\(score)")
                        .frame(maxWidth: .infinity)
                    Text(entity.name.uppercased())
                        .frame(maxWidth: .infinity)
                }
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(color)
                .onTapGesture {
                    withAnimation {
                        editMode.toggle()
                    }
                }
            }
            
        }
    }
    
    private func updateName() {
        entity.name = name.isEmpty ? entity.name : name
        do {
            try modelContext.save()
        } catch let error {
            print("Error saving: \(error)")
        }
        
    }
}
