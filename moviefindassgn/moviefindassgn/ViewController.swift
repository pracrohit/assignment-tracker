import UIKit
import Alamofire
import Kingfisher
import RealmSwift

// Model
class Movie: Object, Decodable {
    @objc dynamic var title: String = ""
    @objc dynamic var year: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var poster: String = ""

    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case type = "Type"
        case poster = "Poster"
    }

    override static func primaryKey() -> String? {
        return "title"
    }
}

// Networking
class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchMovies(query: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        let url = "https://www.omdbapi.com/"
        let parameters: [String: String] = [
            "s": query,
            "apikey": "2c30e4db"
        ]
        
        AF.request(url, parameters: parameters).responseDecodable(of: MovieResponse.self) { response in
            switch response.result {
            case .success(let movieResponse):
                completion(.success(movieResponse.Search))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

struct MovieResponse: Decodable {
    var Search: [Movie]
}

// Persistence
class PersistenceManager {
    static let shared = PersistenceManager()
    private let realm = try! Realm()
    
    func saveMovies(_ movies: [Movie]) {
        try! realm.write {
            realm.add(movies, update: .all)
        }
    }
    
    func loadMovies() -> Results<Movie> {
        return realm.objects(Movie.self)
    }
    
    func addFavorite(movie: Movie) {
        try! realm.write {
            realm.add(movie, update: .all)
        }
    }
    
    func getFavorites() -> Results<Movie> {
        return realm.objects(Movie.self)
    }
}

// MainViewController
class MainViewController: UIViewController, UISearchResultsUpdating {
    private let searchController = UISearchController(searchResultsController: nil)
    private let tableView = UITableView()
    private var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSearchController()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.title = "Movie Search"
        
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        view.addSubview(tableView)
    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Movies"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text, !query.isEmpty else { return }
        fetchMovies(query: query)
    }
    
    private func fetchMovies(query: String) {
        NetworkManager.shared.fetchMovies(query: query) { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
                self?.tableView.reloadData()
                PersistenceManager.shared.saveMovies(movies)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// TableView DataSource and Delegate
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.configure(with: movies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        PersistenceManager.shared.addFavorite(movie: movie)
        print("Added to favorites: \(movie.title)")
    }
}

// MovieCell
class MovieCell: UITableViewCell {
    private let movieImageView = UIImageView()
    private let titleLabel = UILabel()
    private let yearLabel = UILabel()
    private let typeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(movieImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(yearLabel)
        contentView.addSubview(typeLabel)
        
        NSLayoutConstraint.activate([
            movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            movieImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            movieImageView.widthAnchor.constraint(equalToConstant: 60),
            movieImageView.heightAnchor.constraint(equalToConstant: 90),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            yearLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10),
            yearLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            typeLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 5),
            typeLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10),
            typeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        yearLabel.text = movie.year
        typeLabel.text = movie.type
        if let url = URL(string: movie.poster) {
            movieImageView.kf.setImage(with: url)
        }
    }
}

// FavoritesViewController
class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let tableView = UITableView()
    private var favoriteMovies: Results<Movie>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadFavoriteMovies()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.title = "Favorites"
        
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        view.addSubview(tableView)
    }
    
    private func loadFavoriteMovies() {
        favoriteMovies = PersistenceManager.shared.getFavorites()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMovies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        if let movie = favoriteMovies?[indexPath.row] {
            cell.configure(with: movie)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


