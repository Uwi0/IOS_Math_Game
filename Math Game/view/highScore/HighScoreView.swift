import SwiftUI
import SwiftData

struct HighScoreView: View {
    
    @Query(sort: [SortDescriptor(\HighScoreEntity.score, order: .reverse)])
    private var highscores: [HighScoreEntity]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        ZStack {
            HighScoreBackgroundView()
            VStack {
                HighScoreTitleView()
                List {
                    ForEach(highscores.indices, id: \.self) { index in
                        let entity = highscores[index]
                        RankScoreView(rank: index + 1, score: Int(entity.score), entity: entity)
                    }
                    .onDelete(perform: deleteScore)
                    .listRowBackground(Color.black)
                }
                .listStyle(.plain)
                Image("creature0")
                    .resizable()
                    .frame(width: 100, height: 100)
            }
        }
    }
    
    func deleteScore(indexSet: IndexSet) {
        for index in indexSet {
            modelContext.delete(highscores[index])
        }
    }
}

#Preview {
    HighScoreView()
        .modelContainer(for: HighScoreEntity.self)
}
