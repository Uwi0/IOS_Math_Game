import SwiftUI

struct HighScoreView: View {
    
    @EnvironmentObject private var highScoreVM: HighScoreViewModel
    var body: some View {
        ZStack {
            HighScoreBackgroundView()
            VStack {
                HighScoreTitleView()
                List {
                    ForEach(highScoreVM.highScores.indices, id: \.self) { index in
                        let entity = highScoreVM.highScores[index]
                        RankScoreView(rank: index + 1, score: Int(entity.score), entity: entity)
                    }
                    .listRowBackground(Color.black)
                }
                .listStyle(.plain)
                Image("creature0")
                    .resizable()
                    .frame(width: 100, height: 100)
            }
        }
    }
}

#Preview {
    HighScoreView()
        .environmentObject(HighScoreViewModel())
}
