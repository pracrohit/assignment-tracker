//
//  MovieViewController.swift
//  assignment_2
//
//  Created by Shreyas Prakash Chavan on 27/06/24.
//

import Foundation
import UIKit.UIViewController


class MovieViewController : UIViewController, UITableViewDataSource, UISearchBarDelegate {
    var searchTimer: Timer?
    var movieData : [MovieData] = []
//    var movieData = [
//        MovieData(
//            Title: "Game of Thrones",
//            Year: "2011-2019",
//            imdbID: "tt0944947",
//            type: "series",
//            Poster: "https://m.media-amazon.com/images/M/MV5BN2IzYzBiOTQtNGZmMi00NDI5LTgxMzMtN2EzZjA1NjhlOGMxXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_SX300.jpg"
//        ),
//        MovieData(
//            Title: "Game of Thrones: The Last Watch",
//            Year: "2019",
//            imdbID: "tt10090796",
//            type: "movie",
//            Poster: "https://m.media-amazon.com/images/M/MV5BZDdlMzQzNDQtNTAxMS00NTMyLTgxYTAtYzQ0OGI1YzZhY2Y3XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg"
//        )
//    ]
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var movieQuery: UISearchBar!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieDataCell", for: indexPath) as! MovieDataCell
            
        let movie = movieData[indexPath.row]
        cell.movieType.text = "Type: " + movie.type
        cell.movieTitle.text = movie.Title
        cell.movieYear.text = "Aired in: " + movie.Year
       
        if let url = URL(string:  movie.Poster){
            cell.moviePoster.load(url: url) {
                if tableView.indexPathsForVisibleRows?.contains(indexPath) == true {
                    tableView.reloadRows(at: [indexPath], with: .automatic)
                }
            }
        }
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { [weak self] (timer) in
            getMovieData(query: searchText) { movieDataRes in
                guard let movieDataRes = movieDataRes else {return}
                DispatchQueue.main.async {
                    self?.movieData = movieDataRes
                    self?.tableView.reloadData()
                }
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
    }
}
