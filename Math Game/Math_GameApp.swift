import SwiftUI
import SwiftData

@main
struct Math_GameApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for: HighScoreEntity.self)
        }
    }
}
