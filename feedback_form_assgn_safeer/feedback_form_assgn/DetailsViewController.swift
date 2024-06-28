import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    var name: String?
    var phoneNumber: String?
    var email: String?
    var review: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Display captured details
        nameLabel.text = name
        phoneNumberLabel.text = phoneNumber
        emailLabel.text = email
        reviewLabel.text = review
    }
}
