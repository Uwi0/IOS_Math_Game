import Foundation
import CoreData

@Observable
class HighScoreViewModel {
    let container: NSPersistentContainer
    
    var highScores: [HighScoreEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "HighScoresModel")
        container.loadPersistentStores { description, error in
            if let error {
                print("Loading error: \(error.localizedDescription)")
            } else {
                print("Loading success")
            }
        }
        
        fetchHighScores()
    }
    
    func fetchHighScores() {
        
    }
}
