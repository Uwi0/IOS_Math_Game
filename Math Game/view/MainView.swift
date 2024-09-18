import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            AdditionGameView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Game")
                }
            
            HighScoreView()
                .tabItem {
                    Image(systemName: "list.number")
                    Text("Game")
                }
        }
    }
}

#Preview {
    MainView()
}
