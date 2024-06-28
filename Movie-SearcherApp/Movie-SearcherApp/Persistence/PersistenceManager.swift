import Foundation

class PersistenceManager {

    static let shared = PersistenceManager()

    private init() {}

    func saveMovies(_ movies: [Movie]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(movies) {
            UserDefaults.standard.set(encoded, forKey: "movies")
        }
    }

    func loadMovies() -> [Movie] {
        if let savedMovies = UserDefaults.standard.object(forKey: "movies") as? Data {
            let decoder = JSONDecoder()
            if let loadedMovies = try? decoder.decode([Movie].self, from: savedMovies) {
                return loadedMovies
            }
        }
        return []
    }
}
