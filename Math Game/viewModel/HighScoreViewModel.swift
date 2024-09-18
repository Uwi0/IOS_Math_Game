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
        let request = NSFetchRequest<HighScoreEntity>(entityName: "HighScoreEntity")
        do {
            highScores = try container.viewContext.fetch(request)
        }catch let error {
            print("Error fetching high scores: \(error.localizedDescription)")
        }
    }
}
