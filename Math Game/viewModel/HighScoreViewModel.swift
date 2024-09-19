import Foundation
import CoreData

@Observable
class HighScoreViewModel {
    
    var highScores: [HighScoreEntity] = []
    
    private let container: NSPersistentContainer
    private let maxNumberOfHighScores: Int = 10
    
    var minHighScore: Int64? {
        if highScores.isEmpty { return nil }
        else { return highScores.last?.score }
    }
    
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
        let sortDescriptor = NSSortDescriptor(key: "score", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            highScores = try container.viewContext.fetch(request)
        }catch let error {
            print("Error fetching high scores: \(error.localizedDescription)")
        }
    }
    
    func saveHighScore() {
        do {
            try container.viewContext.save()
            fetchHighScores()
        }catch let error {
            print("Error saving high score: \(error.localizedDescription)")
        }
    }
    
    func addHighScore(name: String ,score: Int64) {
        let entity = HighScoreEntity(context: container.viewContext)
        entity.name = name
        entity.score = score
        saveHighScore()
    }
    
    func updateHighScore(entity: HighScoreEntity,name: String) {
        entity.name = name.isEmpty ? (entity.name ?? "Anon") : name
        saveHighScore()
    }
    
    func isNewHighScore(score: Int) -> Bool {
        if score <= 0 {
            return false
        } else if let minHighScore {
            return minHighScore < score || highScores.count <= maxNumberOfHighScores
        } else {
            return true
        }
    }
    
    func deleteScore(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        deleteHighScore(entity: highScores[index])
    }
    
    private func deleteHighScore(entity: HighScoreEntity) {
        container.viewContext.delete(entity)
        saveHighScore()
    }
}
