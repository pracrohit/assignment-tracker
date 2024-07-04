import SwiftUI

struct CreditView: View {
    @ObservedObject var viewModel: CreditViewModel
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

            Text("Remaining Balance: \(viewModel.remainingBalance, specifier: "%.2f")")
                .font(.title2)
                .padding()

            Button(action: {
                viewModel.addCreditTransaction()
                mainViewModel.fetchTransactions()
            }) {
                Text("Apply")
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle("Add Credit", displayMode: .inline)
        .navigationBarItems(leading: Button(action: {
            // Action to go back
        }) {
            Image(systemName: "chevron.left")
            Text("Back")
        })
    }
}
