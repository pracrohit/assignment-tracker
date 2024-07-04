import Foundation

class DebitViewModel: ObservableObject {
    @Published var transactionTitle: String = ""
    @Published var transactionAmount: Double = 0.0

    func addDebitTransaction() {
        let newTransaction = Transaction(title: transactionTitle, amount: -transactionAmount, timestamp: Date())
        DataManager.shared.saveTransaction(newTransaction)
        transactionTitle = ""
        transactionAmount = 0.0
    }
}
