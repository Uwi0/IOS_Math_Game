import Foundation
import SwiftData

@Model
class HighScoreEntity: Identifiable {
    var id = UUID()
    var name: String
    var score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
