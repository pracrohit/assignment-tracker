import Foundation

class DataManager {
    static let shared = DataManager()

    private var transactions: [Transaction] = []

    private init() {}

    func saveTransaction(_ transaction: Transaction) {
        transactions.append(transaction)
        // Implement actual persistence (e.g., CoreData, UserDefaults, Firebase)
    }

    func getAllTransactions() -> [Transaction] {
        return transactions
        // Implement actual retrieval logic
    }

    func getTotalBalance() -> Double {
        return transactions.reduce(0) { $0 + $1.amount }
    }
}
