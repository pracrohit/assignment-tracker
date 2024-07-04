import SwiftUI

struct DebitView: View {
    @ObservedObject var viewModel: DebitViewModel
    @ObservedObject var mainViewModel: MainViewModel

    var body: some View {
        VStack {
            TextField("Title", text: $viewModel.transactionTitle)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Amount", value: $viewModel.transactionAmount, formatter: NumberFormatter())
                .padding()
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                viewModel.addDebitTransaction()
                mainViewModel.fetchTransactions()
            }) {
                Text("Apply")
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle("Add Debit", displayMode: .inline)
        .navigationBarItems(leading: Button(action: {
            // Action to go back
        }) {
            Image(systemName: "chevron.left")
            Text("Back")
        })
    }
}
