//
//  MovieModel.swift
//  assignment_2
//
//  Created by Shreyas Prakash Chavan on 28/06/24.
//

import Foundation


struct MovieData: Codable {
    var Title: String
    var Year: String
    var imdbID: String
    var type: String
    var Poster: String
    enum CodingKeys : String, CodingKey {
        case Title
        case Year
        case imdbID
        case type = "Type"
        case Poster
    }
}

struct Response: Codable {
    var Search: [MovieData]
    var totalResults: String
    var Response: String
}
func getMovieData(query: String, completion: @escaping ([MovieData]?) -> Void){
    
    if let data = UserDefaults.standard.getResponse(forKey: query) {
        completion(data.Search)
        return
    }
    
    let session = URLSession.shared
    
    guard let url = URL(string: "https://www.omdbapi.com/?apikey=2c30e4db&s=" + query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else {
        completion(nil)
        return
    }
    
    let datatask = session.dataTask(with: url) {
        (data, response, error) in
        guard error == nil else {
            completion(nil)
            return
        }
        guard let data = data else {
            completion(nil);
            return
        }
        do {
            let movieDataRes = try JSONDecoder().decode(Response.self, from: data)
            print("items received: " + movieDataRes.totalResults)
            UserDefaults.standard.addResponse(movieDataRes, forKey: query)
            completion(movieDataRes.Search)
        }
        catch {
            completion(nil)
        }
    }
    datatask.resume()
}
