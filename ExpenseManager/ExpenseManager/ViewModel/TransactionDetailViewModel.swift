import Foundation
import SwiftUI

class TransactionDetailViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var amount: String = ""
    @Published var isCredit: Bool = false // Example flag for credit/debit mode
    @Published var remainingBalance: Double = 0.0 // Logic to calculate remaining balance

    // Function to handle apply button action
    func applyTransaction() {
        // Implement your logic here
        // Update remaining balance, save transaction, etc.
    }
}
