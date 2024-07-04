import Foundation

class CreditViewModel: ObservableObject {
    @Published var transactionTitle: String = ""
    @Published var transactionAmount: Double = 0.0
    @Published var remainingBalance: Double = 0.0

    init() {
        remainingBalance = DataManager.shared.getTotalBalance()
    }

    func addCreditTransaction() {
        let newTransaction = Transaction(title: transactionTitle, amount: transactionAmount, timestamp: Date())
        DataManager.shared.saveTransaction(newTransaction)
        remainingBalance = DataManager.shared.getTotalBalance()
        transactionTitle = ""
        transactionAmount = 0.0
    }
}
