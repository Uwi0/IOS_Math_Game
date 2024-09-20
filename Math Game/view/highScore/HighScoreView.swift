import SwiftUI
import SwiftData

struct HighScoreView: View {
    
    @Query private var highscores: [HighScoreEntity] = []
    @Environment(\.modelContext) var modelContext
    var orderedHighScores: [HighScoreEntity] {
        highscores.sorted{ score1, score2 in score1.score > score2.score }
    }
    
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
