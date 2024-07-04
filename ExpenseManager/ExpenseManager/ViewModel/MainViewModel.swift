import Foundation

class MainViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    @Published var totalBalance: Double = 0.0

    init() {
        fetchTransactions()
    }

    func fetchTransactions() {
        transactions = DataManager.shared.getAllTransactions()
        totalBalance = DataManager.shared.getTotalBalance()
    }

    func updateBalance() {
        totalBalance = DataManager.shared.getTotalBalance()
    }
}
