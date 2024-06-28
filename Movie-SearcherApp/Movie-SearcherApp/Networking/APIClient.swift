import Foundation

struct APIClient {

    static func searchMovies(query: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        let apiKey = "2c30e4db"
        let urlString = "https://www.omdbapi.com/?apikey=\(apiKey)&s=\(query)"
        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(SearchResponse.self, from: data)
                completion(.success(result.movies))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    struct SearchResponse: Codable {
        let movies: [Movie]

        enum CodingKeys: String, CodingKey {
            case movies = "Search"
        }
    }
}
