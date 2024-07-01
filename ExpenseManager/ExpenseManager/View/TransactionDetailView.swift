import SwiftUI

struct TransactionDetailView: View {
    @ObservedObject var viewModel: TransactionDetailViewModel

    var body: some View {
        Text("Transaction Detail View")
            .navigationBarTitle("Transaction Detail", displayMode: .inline)
    }
}
