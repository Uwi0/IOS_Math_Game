import Foundation
import SwiftData

@Model
class HighScoreEntity: Identifiable {
    let id = UUID()
    var name: String
    let score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
