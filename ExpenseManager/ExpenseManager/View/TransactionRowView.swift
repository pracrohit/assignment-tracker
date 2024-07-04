import SwiftUI

struct TransactionRowView: View {
    var transaction: Transaction

    var body: some View {
        HStack {
            Text(transaction.title)
            Spacer()
            Text(String(format: "%.2f", transaction.amount))
                .foregroundColor(transaction.amount >= 0 ? .green : .red)
        }
        .padding()
    }
}
