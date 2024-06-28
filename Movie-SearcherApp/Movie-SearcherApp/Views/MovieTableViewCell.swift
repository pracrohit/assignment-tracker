import UIKit

class MovieTableViewCell: UITableViewCell {

    private let movieImageView = UIImageView()
    private let titleLabel = UILabel()
    private let yearLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        movieImageView.contentMode = .scaleAspectFit
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(movieImageView)

        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)

        yearLabel.font = .systemFont(ofSize: 14, weight: .regular)
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(yearLabel)

        NSLayoutConstraint.activate([
            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            movieImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            movieImageView.widthAnchor.constraint(equalToConstant: 50),
            movieImageView.heightAnchor.constraint(equalToConstant: 50),

            titleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            yearLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10),
            yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            yearLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            yearLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }

    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        yearLabel.text = movie.year

        if let url = URL(string: movie.poster) {
            fetchImage(from: url) { [weak self] image in
                DispatchQueue.main.async {
                    self?.movieImageView.image = image
                }
            }
        }
    }

    private func fetchImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            completion(UIImage(data: data))
        }
        task.resume()
    }
}
